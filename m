Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E196C77B7A
	for <ath12k@archiver.kernel.org>; Fri, 26 May 2023 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8Lm8K/7tVkliK1rSzAWWeci1yzP0UAbhu5Li4oLDZU=; b=v1xvQJhN6N1/xC
	lOHY3LxjwMBaruAuBHabUwYGPa2Cz4LNL/Vx12l7GizubHATd50fQNBfiMZM5OPBxb+kFqDYPFMhO
	CQ7SzKVMfN8O1JNVs00Kig4YfQy9q0gYTC6ljLIK3knir9of7lSOJbHvsH9wxh2ho55/2/89sNfjI
	bN7FSkZWdGf2pOFIQasw32viL6u5BWahMl9BT4a70CU1+W5AEMfxcN/91wcgq/4y5h2DEkrkyXQtM
	xIo2GA7uuWRc1iEdOaW5QXhTWyMwIywA0GQRe3CnftCzHq5RqrpSgGPQyChRRIiN8O8KF4c64pxBE
	Sj1pm5WMmWYVOZXRePhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tuc-001qgO-07
	for ath12k@archiver.kernel.org;
	Fri, 26 May 2023 09:39:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2TuY-001qei-1B
	for ath12k@lists.infradead.org;
	Fri, 26 May 2023 09:39:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3F9064E8F;
	Fri, 26 May 2023 09:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB4DC4339C;
	Fri, 26 May 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685093941;
	bh=1jvDYFDddIWiMkiwRme9di50H0U0k1tYRF66A/E0T+I=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r5m9jmtI9Zkkmvbd+aQ9MJlZOEoXSn7NdimYdX7dU4n7nSbFPJJDOwT1u3pgWUtcB
	 +VXFnJy8DAzBFIGNv6hd7LrdvlzbsnsCwEq6+vpGIadP3KD2PweUlJAqumh0Q+bRuG
	 34l3mTTiwv/+PuqtlAasgJVLetRX9DbVVI6cMqlSHN7iQbqJMkb4JgXVAHWzPW+uQo
	 RRqLZfXIBiagk28tgOQl5woSVKT60UTUvow5B/pJGFB9OWUE/cC8UrAGCVYVBkam62
	 NGLoJa3M0CVbZrUx1KaZyP4slooQ1067t69vtw/nfW0jwUIkwhljIKw+q4nnXGyn5D
	 Vsf1lBa7Dar8w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Add support to parse new WMI event for 6
 GHz
 regulatory
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230502142018.20301-1-quic_rgnanase@quicinc.com>
References: <20230502142018.20301-1-quic_rgnanase@quicinc.com>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <quic_ppranees@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168509393704.23037.3611388693586746214.kvalo@kernel.org>
Date: Fri, 26 May 2023 09:38:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023902_446039_1B8F8CFC 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ramya Gnanasekar <quic_rgnanase@quicinc.com> wrote:

> In order to support different power levels of 6 GHz AP and client, new WMI
> event for regulatory (WMI_REG_CHAN_LIST_CC_EXT_EVENTID) has been added in
> firmware to provide new parameters required for 6 GHz regulatory rules.
> 
> Firmware advertises its capability of handling new event in WMI service ready
> event. Based on that, host needs to set host_service_flags in WMI init command
> to indicate that host supports processing of this WMI event. Based on
> advertised host capability, firmware sends event WMI_REG_CHAN_LIST_CC_EXT_EVENTID.
> This new event contains 2G/5G/6G reg rules with additional power value fields
> for 6GHz and regd is built accordingly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

342527f35338 wifi: ath12k: Add support to parse new WMI event for 6 GHz regulatory

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230502142018.20301-1-quic_rgnanase@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
