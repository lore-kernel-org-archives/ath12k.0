Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D82C4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeIlzsc2SvmpotsmagTGs8K1uLENDmkOaRdBsbI40Ws=; b=qdD5pbo8TWEnbQZMoV4u3Qf+h+
	o88LZrHnwFe7K8Qvgvm5xswMNu3BQv5D6vaBGI5f8gqrPmv/wCwv396gdFRF876VyvKBoHUo1JRuV
	DO/KnP06X8jSC02NkfH0NYs2W3CyG3IvAi8YVfDmh6rNTW6xsog2wf6YxuKzbYjUf0LOeMzby5q44
	Bh9s6uGkmkQFqhk0QnXhnll+N1n5gfyFAhjevCgsjWrvD7LBBKAHRavKPV4PtZi7wJqq2DSrG7S/q
	/K+rbKRBFe60kgQ8L8m5PdKGSa/5ENaXLI1POpEn4dhfqzhUal48lolBAkoDuT8kFFgXYs3vH9GBA
	g8sP/VWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxSH-0000000D7fp-3rtD
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 16:39:18 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxSC-0000000D7bd-3I4P
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 16:39:15 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 0F7C620338;
	Thu, 11 Apr 2024 18:39:04 +0200 (CEST)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id F31D82013F;
	Thu, 11 Apr 2024 18:39:03 +0200 (CEST)
Message-ID: <af70ee81e583f58dada3dde87ac335137c4038b0.camel@freebox.fr>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Maxime Bizon <mbizon@freebox.fr>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, Ben Greear <greearb@candelatech.com>, Johannes
 Berg <johannes@sipsolutions.net>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>,  ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 11 Apr 2024 18:39:03 +0200
In-Reply-To: <5fc2f2d2-7403-79d2-8909-ddda918ff8d5@quicinc.com>
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
	 <29f7ecb6d7c208c3614f37616943d5f97bb134d3.camel@freebox.fr>
	 <5fc2f2d2-7403-79d2-8909-ddda918ff8d5@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_093913_246138_1D3A47DA 
X-CRM114-Status: UNSURE (   6.44  )
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


On Thu, 2024-04-11 at 21:56 +0530, Vasanthakumar Thiagarajan wrote:

Hello,

Thanks for making it clear,


> > For example, starting a 5Ghz AP in ax-only mode, and at the same
> > time
> > creating a STA interface on 2.4GHz ?

> Yes, such use cases continue to be supported in single wiphy mode.

Understood, but I see some corner cases.


For example, assume two bands AP hardware, 2.4GHz and 5GHz.

Previously:
  - phy0 is 2.4Ghz
  - phy1 is 5Ghz
  - iw phy phy0 interface create wlan0 type managed
  - iw dev wlan0 scan

=3D> will only scan 2.4Ghz


With single phy approach:
  - phy0 is 2.4Ghz + 5Ghz concurrent
  - # iw phy phy0 interface create wlan0 type managed
  - # iw dev wlan0 scan

=3D> will scan both bands ?

  - <starting from previous state>
  - # iw phy phy0 interface create wlan1 type __ap
  - # hostapd -i wlan1 <config>
  - # iw dev wlan0 scan

=3D> what will happen then ?


Same goes for hostapd ACS, I assume specifying freqlist becomes
mandatory or we can't predict which band the AP will be on ?

--=20
Maxime




