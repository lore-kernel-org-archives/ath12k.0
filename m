Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31930CCF2C4
	for <ath12k@archiver.kernel.org>; Sat, 17 Oct 2026 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DmjvHLfi4rX4oDVLRHrraRfixBiGRCaeJVcON71fCc=; b=gfeGSMKTEB5bKBVg5bTBRcZ1uD
	JCDwK3d7zqqJHj18t2uG9RwZmzXXHFhCdnMinMXuV5lf1Xeu0EO1VOewp3ppRaAZLEHSibSe39BjN
	yNYy8kwo+jIspMz1yN9M6DUaRW3Nr51XpEae6J53n014EuH75SUPd34NueTkx28352tvjHn8XZJ47
	1BqkGLm9vpOnTGPwvCViZYCC2yKd8NMWKf8fwWz59VVD9yyyvGAm73sn8pBN79so9X7O+S4pA9kVF
	KYtHdPBPCOkAD/wDmBCXULMYm/TtnHolypQDbf5tZjr4csg3rlQQvLv3pToCIalP6UtK1NxW1Wm5N
	ltURmupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7mX-00000004yIe-3AsE;
	Sat, 17 Oct 2026 17:01:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7mO-00000004yHv-3XoD
	for ath12k@lists.infradead.org;
	Sat, 17 Oct 2026 17:01:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57D7142A1D;
	Sat, 17 Oct 2026 17:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B221F000C5;
	Sat, 17 Oct 2026 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256468;
	bh=0DmjvHLfi4rX4oDVLRHrraRfixBiGRCaeJVcON71fCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gl5h4+21xkTA9HLQn4DCTs3dAc+/A/QPpnLU1SnPGP/SZuZwzQCZD5wRkLZ4x+0Fn
	 ZsBaGWHLcbySiBu4SZ9zF53I31dkjHvaWTBp3QpuFWsoYrB9BHHE9W+ebxm/ty2NVe
	 0jIxPi2ImaHKinHaFjyFC/DONvjUn6MPiid98ZGRVf8qnrS2XMEKKEocbZ83bAqPC4
	 zHhZ5u0AukVJbeIWN2H+a0rOoYwY/Ta8jN9R13lJOPzzZt3VoRy63G5OK4qKBmetZ6
	 hnhXxWpl9yuKL1IdMUm0B44RlTcKbwXlMIbcddd7uJrTp6x7CD1So2qvWmEHTwY27C
	 bGSiGeyptPOEA==
Date: Sat, 17 Oct 2026 19:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add
 QCN6432 device tree binding documentation
Message-ID: <20261017-exuberant-benevolent-gibbon-86a45b@quoll>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
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

On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
> wireless device.
> 
> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
> platform device, even though the Wi-Fi hardware interfaces over PCIe.
> Document the compatible string and the resources, including the Q6 remote
> processor phandle, MSI interrupts, SMEM states and memory regions.
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> ---
>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++

Heh, unfortunately need to retract my review.

Filename must match compatible.

Best regards,
Krzysztof


