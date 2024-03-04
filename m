Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1ECC54E41
	for <ath12k@archiver.kernel.org>; Mon,  4 Mar 2024 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQnxJCGBSmzZ+S6U1W7Ysy6ly+i4D+aupCTEOqXfKJg=; b=pRCSJulN+TQsYHjL8gWGbV7Cn8
	qupkqvqUVj3PaOS+sN0TOwoe7Grx4DDDHSfiIKM7bFhwLm34JoBJm5qUtHV6uYX+0e6TgD7DvT72c
	1bUlcv8FG3yyjuUyF9H0Wd3R/ziw1Q/FDKgPIgZh35ZTwjW0U8wIPML+qkx2neb9+fZVGJrALstKy
	F0sZDNOUfXCvsG4FSJMRwc1CF77WCYQZCruTTyUcXr49gbFGcgbLk8qcITO/JDzb2IITWUR+DyDhC
	hC21ppDYaygJE93QGKeAvBGvvn/6lPaAvkXfXctyMGYjPPo8PKl2U/avH1NSaC0mDyw+d8eBB4TSW
	tSKlQopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3u5-00000008B5b-2pv4
	for ath12k@archiver.kernel.org;
	Mon, 04 Mar 2024 08:42:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3u2-00000008B4U-0tyW
	for ath12k@lists.infradead.org;
	Mon, 04 Mar 2024 08:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3236CE10F4;
	Mon,  4 Mar 2024 08:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA214C433F1;
	Mon,  4 Mar 2024 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709541747;
	bh=n39k5IWguKIPVo0AbP4RHmUCj+p7+SusDkiJx3jxedo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kryt/BlDzM82mbk9xjCjLCJ7jh0bDdZg9BvzjEFb9f9b/Q3XX3vOrPKU8iFjsEjyr
	 6c/NpSEJq4RsXoEKgOa58+DTxR/FU/ogti/sv/YvfCCzRLL626Of+Nc9bHV6mKaxTq
	 yHkQxDsQ2U3L1bbxsUqxQ2Z+ctGyj69aHdch2MS5cUML+7PTXfE+BcPXaadfDS8TRz
	 CW9o3fGhmDHPYXBAuqwFITM6N9KCG3v0n+0LsQYv4Q2XFfsN9768Rts+AKZd3KDQZr
	 2Rj56mEKEkLcuAGZH9sO5biBGG6uoXiiDAXCv97Pps+/XT0NfBOJNDrzzDgZOe3Q+p
	 lnhel/MRssBZA==
From: Kalle Valo <kvalo@kernel.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  quic_periyasa@quicinc.com,
  quic_kangyang@quicinc.com,  ath12k@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>
Subject: Re: 6GHz AP association failure on WCN7850
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
	<ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
	<CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
Date: Mon, 04 Mar 2024 10:42:23 +0200
In-Reply-To: <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
	(Jun Nie's message of "Fri, 1 Mar 2024 17:14:37 +0800")
Message-ID: <87o7buie1c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_004230_474881_72728090 
X-CRM114-Status: GOOD (  12.57  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jun Nie <jun.nie@linaro.org> writes:

> I see there is association failure many times when I try to connect my
> 6GHz AP with latest mainline Linux. Does anyone also observe it too?
> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
> recommend any specific version firmware?
>
> The issue only happens with this version firmware:
>   [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
>    [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
> board_id 0x3d soc_id 0x40170200
>    [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
> fw_build_timestamp 2023-09-20 03:43 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
>
> I do not see the issue with firmware:
> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
> fw_build_timestamp 2022-10-11 12:13 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Detail log can be found at:
> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-association-fail-log.tgz?rlkey=pg2ifnzcttzimz7vaxb7tuc6w&dl=0

    List:    ath12k@lists.infradead.org
    From:    jun.nie@linaro.org
    Subject: Re: Performance of WCN7850
    Reason:  Message body is too big: 1294317 bytes with a limit of 500 KB

BTW Jun, please don't submit 1 MB files to our lists. That's just too
much. IMHO 100 kB should be the maximum even if the list has 500 kB
limit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

