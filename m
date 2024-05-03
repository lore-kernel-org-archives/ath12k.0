Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BF4C4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/CucrM1UvFS4v060w9y1q+W4JQqFvhwFbb6E8KZHQ4=; b=s/054g0a+liswnRYnAjVEjMexF
	70XppKp33oTLAJWaq6wYZZiEEdDHwMM2f8kUUOP5lD5Mkr1j6KQ8xBClyu90pv8hAMeIjD8Q/QSBz
	l+PeUpRI3Zd8HHrnxVrhF6z/SYe04cDfw3iIfIfDpJvQY8u+ki/QK9P/b/c+8BTUeKNpKkNY1qqit
	1/9wFd2oiuYl/UEsR07Z89Pz9r5Rcx6gucjvP+YzF0z3++1luyb5fLcXsiudjlVKVzDJn9+MSSCYp
	QMRnv9DFRpkxU3RU2WgaVwblro1QZGw+zScQYO6mXad0J9S693/VN/L5I3hHefRu1bpDF4l2RYXwt
	FXUflLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oFS-0000000Fdug-3h5Z
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 08:26:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2oFP-0000000Fdtv-3MgX
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 08:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=f/CucrM1UvFS4v060w9y1q+W4JQqFvhwFbb6E8KZHQ4=;
	t=1714724787; x=1715934387; b=nfZx9g4GyjdEpR9+i5e4at9ykoVsowHSBW+HBVd0P/pZPMz
	2dmGkll4skMV+1abU9pnqEnWr3TdIUoI4Hia0wLjYbDwqDo9LQrmekZ3tD+HrLlBr+4+80hxO7rQl
	2XMfgZYlD+SgQwxOiuyA1GPx86JCzT2v+gd7mX4RThqfZfuey/BR42V/QUVCdNbsLx0UDXQn6i1Xt
	H4ZJkgD+bry454E71xJBV4chT2FZmH9+32VR2/OU8I6m+32eQpb5peNPUuz22nlf/zqYgPB+QKLjz
	BYNPnwMeTt0Mor1GweDj3LBVT2mbYIm8VpIK3QoyPNV7i/WOmBVTXS/KxbOzjCYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s2oFN-00000001fk2-1SI7;
	Fri, 03 May 2024 10:26:25 +0200
Message-ID: <21cd883ea7d3a7735bbba2c85f5d9e5d5803b5d6.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211: Allow pre-CAC for self-managed wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <quic_hprem@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 03 May 2024 10:26:24 +0200
In-Reply-To: <20240429042723.2847389-1-quic_hprem@quicinc.com>
References: <20240429042723.2847389-1-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_012627_862877_413F2010 
X-CRM114-Status: GOOD (  11.75  )
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

On Mon, 2024-04-29 at 09:57 +0530, Harshitha Prem wrote:
> Currently, to allow pre-CAC it requires both driver's regulatory domain
> in wiphy and cfg80211 local regulatory domain to be same, along with the
> region to be in ETSI.

Any idea why that is?

> But, for self-managed driver, some countries have mismatch between these
> two regulatory domains and it would not allow for a pre-CAC. For example,
> in ath12k driver (self-managed), country Sri Lanka (LK) is classified as
> FCC domain as per cfg80211 local regulatory database but as per ath12k
> driver it falls under ETSI domain then because of this mismatch, the
> driver might not be able to do a pre-CAC.
>=20
> Hence, add changes to allow pre-CAC based on wiphy's regulatory setting
> if it is a self-managed wiphy.

I don't see how that's really all that much more helpful than simply
removing the restriction? But then why is the restriction there?

johannes

