Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF7CD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 18:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBk+DfF+9TrNkFoJgldIrwk6rXgdE9PyQYleu39XY7o=; b=R18oZpfBv087XVE1pObZbmkQpZ
	tfZ8OvBnE9qxtH1YY5OTGvhPYvezdbkYvCBeo+MdPfPhYYP5/DS8DdhsBOTZIGbI0/lgGc/9lkTH1
	M8S9AYkms2ULLuGkVJTv6SWf+EaYffHGzJLxrNLz80dbSIbp2BdhEgeuzlWoSSICrn2dKPiG0Wts7
	YVwXJE9YzQlgkanNDhZdq1W7RU9r6jfPvdExnSoJB848Hqb7HMclzwwiZZ/QqEvfgldeJstoHU5f5
	LaKVy5aTiPFoFKLkA9/rMM7KGGi0lpKD8OqhoHQBODB+pxKuxyNu12c9M8V59q2Bc9nPexsMzrkc0
	+P2D1/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucNP-00000008QEz-1L7a
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 18:08:51 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucNM-00000008QDV-1RIp
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 18:08:50 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id A0F09203EE;
	Wed, 10 Apr 2024 20:08:46 +0200 (CEST)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 908422018E;
	Wed, 10 Apr 2024 20:08:46 +0200 (CEST)
Message-ID: <29f7ecb6d7c208c3614f37616943d5f97bb134d3.camel@freebox.fr>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Maxime Bizon <mbizon@freebox.fr>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Ben Greear
 <greearb@candelatech.com>, Johannes Berg <johannes@sipsolutions.net>, 
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Karthikeyan
 Periyasamy <quic_periyasa@quicinc.com>,  ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 10 Apr 2024 20:08:46 +0200
In-Reply-To: <0cfe990b-182b-4ceb-b5b4-2989fefedb2f@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
	 <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
	 <80fe5786-f764-455d-ac44-22adf7aeaf94@candelatech.com>
	 <31f30c0e318904f3a082c7f213576ceb1f407141.camel@sipsolutions.net>
	 <20b56e52-a5e2-70cd-a62a-8c4a3526c2cf@candelatech.com>
	 <614bb8a8f1d9174ad7d87cf7636f657cda7b1ef9.camel@sipsolutions.net>
	 <aa9e1d54-bb5f-37cc-335f-c9970ab13789@candelatech.com>
	 <0cfe990b-182b-4ceb-b5b4-2989fefedb2f@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_110848_552929_8FE6DB71 
X-CRM114-Status: UNSURE (   7.06  )
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
Reply-To: mbizon@freebox.fr
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Wed, 2024-04-10 at 09:43 -0700, Jeff Johnson wrote:


Hello Jeff,

> Ben, the patches we have posted so far allow ath12k to either have
> each phy assigned to a separate wiphy (legacy operation) or have
> multiple phys assigned to a single wiphy (required for MLO
> operation). In an upcoming patch we'll introduce a DT-driven

When the physical wiphy are grouped in a logical single wiphy, can we
still do "legacy" operations on the individual physical wiphy ?=C2=A0

For example, starting a 5Ghz AP in ax-only mode, and at the same time
creating a STA interface on 2.4GHz ?

If not that's a regression. Changing DT (imply reboot) does not really
fix the issue.
=20
--=20
Maxime




