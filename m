Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBDFCA5FED
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xikyVEMlNs2e/HBpNM9BkmXFnszCMbxeC6ukLrXFPa4=; b=GrY8FIyLVajB+xIVUX1qgrI/Tl
	gC6Aw6yZ4InHgMI9Mbytuwag7Nt04HWE7ziDBRr8wnL75dMwJsUPmg3KWZIZy7QRv35zGbsU7RQUC
	6/Jvxo9ZsPcbpS3eVL+GqFLsaBhWMCMtOIW37OE2vtIw2tE8mLIWbVmOza/Zdx64KOatdIQdz1qoi
	Lw5kRs/gBKdNSHtygXkuGop5tM0JEYzS+FkVnHLiX+gc4BIomLRIvWaxPQ/cjVAT3aEF9jPVHjqq4
	f9dH2fsJtv0yLEFYQ4Ke8cjEbaM7OCzqtU5fb/w2Vo6wqFHQoUMU79aNW30U2rxXbOtovkYBn9WHS
	cw0OArqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECeU-00000001Ovo-1Iho;
	Tue, 06 Oct 2026 21:24:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECeR-00000001Ov6-1QjZ
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 21:24:45 +0000
Received: from francesco-nb (unknown [81.0.251.149])
	by mail11.truemail.it (Postfix) with ESMTPA id 0097722BA0;
	Tue,  6 Oct 2026 23:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791321876;
	bh=xikyVEMlNs2e/HBpNM9BkmXFnszCMbxeC6ukLrXFPa4=; h=From:To:Subject;
	b=oOYNBQ7NJqLxLJFlzLwTCbhyCO4QZznFs05+cPLGLK7/QnjVJZMHKEr8fQ141PcB1
	 BPddnX9CWkcsTCCIzn9zcUhyj5NcSQzl15VKgdZHHmB8TVDtQfsRGt0P/DkogZLbiF
	 vuiVT5LUGx7pdbgkU8Z+zDhXcoVfDwfgOYxQIOsAiZPurvP2Xk6KO7YmchnoSUyw8u
	 G4V8UPaqYRJSo/GHciarRM4VeH6+YzSY7IS3IkZcsJLDcHilsYKZeHVGpjO0jzfP7r
	 m1HZFNL+RZKwGQBxi4IGu1wbZp2r9rDPwy3qYUuOGrCWaxThiRK8H2OPtBW0gSwzRT
	 OoE6R0H/TficQ==
Date: Tue, 6 Oct 2026 23:24:31 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
	kang.yang@oss.qualcomm.com
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC
 address pool
Message-ID: <20261006212431.GA113439@francesco-nb>
References: <20260922200643.1133491-2-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_142444_301983_66F0B140 
X-CRM114-Status: UNSURE (   4.51  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello,
just a gentle ping

On Tue, Sep 22, 2026 at 09:06:42PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.

[...]

> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>

Any plan or concern on merging this?

Francesco



