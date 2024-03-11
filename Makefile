svn:
	@echo '拉取SVN代码中...'
	@git svn rebase
	@echo '拉取SVN代码完成'
	@echo '同步至SVN...'
	@git svn dcommit
	@echo '同步至SVN完成'
	@git pull --rebase
	@git clean -fd

svg:
	@svgo --recursive .

new:
	@echo '修改.git/config文件中...'
	@echo "\n[svn-remote \"$(VERSION)\"]\n\
  url = $(SVN)\n\
  fetch = :refs/remotes/$(VERSION)" >> .git/config
	@echo '修改完成'
	@echo '拉取SVN代码中...'
	@git svn fetch $(VERSION)
	@echo '拉取SVN代码完成'
	@git checkout -b $(VERSION) $(VERSION)
	@git push -u origin $(VERSION)
	@echo '创建并推送git分支完成'