Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075A5CCF9F8
	for <ath12k@archiver.kernel.org>; Wed,  5 Nov 2025 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkTC+8vz9rlIGdO40HdvQrczR14lJ9vNHU0NhhLbeBU=; b=4HT7hKkzS4Shox+9weKuM3YTQZ
	nmWXoorpFpYHn6FXf0OP36azWj8B4LFk+No0t3qNPMSYJ54SZq1512m/0ekl+SyVPAG8A0uKSL4yM
	+EXKfhPp1AdXbgJAervRPP4UTUnuxPRWskfuuiy3A83tM/IEpUDMyIoxh+HjtjIRPhCPjGXHChdAz
	lgnY3BZRoJDHr61/6vLnfijumo/JmIxmOvTGt2Sy/XVgaFRErUC/+f7jWEJzJUCoXF2cdk4kOM2+Y
	SeKEkHskRZjxsEU7fE1ZpqjAabBHQPV8zm6JnyzOir3S8LCqf+/tvwQknGzZ9aVgmJ2DmyKomv/mg
	YCVvwUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfJc-0000000DutN-292T;
	Wed, 05 Nov 2025 15:20:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfJZ-0000000DusU-2But
	for ath12k@lists.infradead.org;
	Wed, 05 Nov 2025 15:20:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5FI8I0050980
	for <ath12k@lists.infradead.org>; Wed, 5 Nov 2025 15:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkTC+8vz9rlIGdO40HdvQrczR14lJ9vNHU0NhhLbeBU=; b=Lidao/OFkl9z1saB
	irf4GF4KCHv4T2LWzpfvRzLt1UFMJe3fWyxEwVfV3QtpzASLIF0/oWB3CODQBBw+
	LLHq+3omLqLtwqUl/yfdMcUDYRv+v3+CUl14xhoxgIprQmvpSKiiRi2iGHxvgt+g
	Nv1gjsEKvGOiAvwztKC4aqWwtxn1RNXzFl52jP1+kfsBmqBi2CTDLW25T2oXCEgR
	Z/fvNXaRcBGRL6i6PHhF+Sccwo0NMRS/aN8H6migaxh9aHDA/Ij3Jw+LhrUwYmJF
	rmAdaIcQ6/7HQqVC5C4IwtR+ogMac4Gpt7jIe2z9zkEuckBfWPH5LCx7EJ0oZBoL
	f5CO9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a81u0hcsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 05 Nov 2025 15:20:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa148105a2so3400548b3a.1
        for <ath12k@lists.infradead.org>; Wed, 05 Nov 2025 07:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762356047; x=1762960847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkTC+8vz9rlIGdO40HdvQrczR14lJ9vNHU0NhhLbeBU=;
        b=GJTF/oNf30liIAt8drOBKg9a2DSWyEFPP7J777xEbCXFxVeYOlLRdqzYC8Wokk94vP
         ZprevZXkhwPf/GPkAnS4KTvFFbmxi9TfvOHy42Lq3bfNfn4O5qu19pJIqbQ2h4KPxOEM
         p35QbTHIzentHSFgMCbEIS9cvcLrmoFxX9q/U+pLWiCo6J/SxwkTlAUWD1Gw/ZHXtoGp
         gTh6sUIr8U6DdhJrR50PiDZuT7QAunKLyi6gHLOn+FECmnzCP99WVjbZAZQrb6EE8l92
         xVXfu4c0gN+uooT8oNGjIv+hY9ncFw1UHO/DziiqXtei8/Wfexu4XQGHWU8NsNjpDnK5
         qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356047; x=1762960847;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkTC+8vz9rlIGdO40HdvQrczR14lJ9vNHU0NhhLbeBU=;
        b=DXMqzbYH/TsqS65SfWlrBBkwp7JeXtAB9r11V/ENOTz+dPSjtFk4fj6MPyqIUOvC7h
         TjaEClbU/vXNsFAi2a+OENJU0L3MCAOURMfeyXSDdd+iOIV8m9Qm9Z3OoWSX+wsaiO2P
         w928K/FPLy4i+yVpf1mZgiBQ5x67SCP+3vGL16ADnPQ2fctMsWhQyU3Xigkq/XgJ2+Rn
         DfwMffJHvvlF5zuJpSV+6GgZRbto/BWrsATXzC/UNUp+rwl+4dhUP3g8+2jCtFzMY1PW
         NmC6aIC6lLH2+0fEwEWOcNPqN4AFzTGVw2gY/q0nn6QkpV5B8+EK6vIrUJHKFXpH3xc+
         Znxw==
X-Gm-Message-State: AOJu0YzLtZnvzDvCybpEFRwoNWxL0hewikpq9qeBTq7Jw/qDl4zCUJMV
	jA/HX9qiL20F2+VcfYfiWnd7Ef4YLLyMSQhyx7MLpXVi0R1zP1a9zq4E4rBLID1JCoXdGddwa4j
	2gm3iRo7mQ+lFAYSIDo1Br+b4Pou8GBb4XNucJ38OQd6h2MuWK7vXCKwHeZzpYg8zTv5WoALi
X-Gm-Gg: ASbGncvWeo3JZZAYygridtlsCntjRF/6Adzl+cjUUJToSoJUM7uR5bb98uh95z5nonc
	jWljGIHKxBPqVyy9ev7uQSoDU3HLhihoO9HjAMHLQcMzjdN+DkGUHL8Ay98ez5DHo3kQFmfho5Q
	LO9jOxxwTIY5kSs/GBqE20wqETaJeNHId/7cIQuIq1NbTZ/rvlXrzpIVYlUhLRr9O3y1M7rdjpp
	dvSAd31Tj49CI/cl0ezej3sA0dWsIZWdb/QGPGAUyMQRtseCij3omRl+oc9yIqYAYXsUI6TSBwk
	TTu/+qgCscrIEYagmBDZUfubN6iE8hoXtZI2FVTlz9j4ULNE+6M/IHZ4bozzVo3MCC4UDrI7qjl
	UIIF9Mrhy3w3Xg83AWvBzDfpcJmqNuT4Q79E=
X-Received: by 2002:a05:6a00:4601:b0:7a2:74e5:a4a4 with SMTP id d2e1a72fcca58-7ae1eda0949mr4171049b3a.19.1762356047280;
        Wed, 05 Nov 2025 07:20:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8JDT507lZ+BZEsWZt0xVAtyRwefGvMFtqGsB/ejUTjivfmX9GhF7Yz88ZsBefY7bNJi01Gw==
X-Received: by 2002:a05:6a00:4601:b0:7a2:74e5:a4a4 with SMTP id d2e1a72fcca58-7ae1eda0949mr4171010b3a.19.1762356046729;
        Wed, 05 Nov 2025 07:20:46 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd382ad96sm6699198b3a.22.2025.11.05.07.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:20:45 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
References: <20251103112111.2260639-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Modularize Wi-Fi 7
 components and refactor data path structures
Message-Id: <176235604541.1854100.8439378063481655691.b4-ty@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 07:20:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: R-6FQ2qaV6dHNsO_vW5Y-ZSXPm1H5SSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExNiBTYWx0ZWRfX/uC2fPo0v2w1
 D3vA26GmhBCH0N+BA4D8Zoga+/8vIUyuRbHLNhUC8PKZaYF+y3bH5RvNDGlc3aOx2woJ7/jgD5k
 XQYNIiWsKJWPJwkVYTSxJEdTyb7jooMLVUmHzjyDmvhGRl9+uhPLTfCWMwwaQHmLr42C7MOUSK3
 ZVeJuMOaK2mCTDMEOYVq3Al65CqbdyjAj80r5bnk2G/Si7B0vBL4j1gyEoXm/ibmugFspFSRflU
 5gELkmHxcY8qlBjXrGApQS6M+SD6lh35sVOdg3aKACmQSRIAP02cTmeNzS/q0Re7fpielJcBiHb
 c5XrhtwNaOGPukyTvPMaGBUO256KT+MQjf8AoTbam94EhS4MVKjqNBB9FKshLknCGoEaFKjViSt
 m+QBWBf2K587+qCgIIWDtOR7p73PfQ==
X-Authority-Analysis: v=2.4 cv=KaXfcAYD c=1 sm=1 tr=0 ts=690b6b50 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2f47RPNSW2tIX227sv0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: R-6FQ2qaV6dHNsO_vW5Y-ZSXPm1H5SSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_072049_573569_F4B74C82 
X-CRM114-Status: GOOD (  11.61  )
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


On Mon, 03 Nov 2025 16:50:59 +0530, Ripan Deuri wrote:
> This patch series introduces a comprehensive set of changes aimed at enhancing
> the modularity and maintainability of the ath12k driver, in the context of
> Wi-Fi 7 support. The key updates include:
> 
> * Callback Integration for Wi-Fi 7 RX APIs:
> 
>    Introduces callbacks in arch_ops for RX-related APIs defined in the Wi-Fi 7
>    module. Adds wrapper functions to invoke these callbacks from the common
>    code. Enables seamless interaction between ath12k.ko and ath12k_wifi7.ko by
>    leveraging the ops mechanism.
> 
> [...]

Applied, thanks!

[01/12] wifi: ath12k: Add callbacks in arch_ops for rx APIs
        commit: 73c928346d095533ac56569bdd57c55d3ca81c3f
[02/12] wifi: ath12k: Move DP device stats to ath12k_dp
        commit: 775fe5acc18df4de4bad774faa50c88ee65882eb
[03/12] wifi: ath12k: Move DP specific link stats to DP link peer
        commit: 35fcf4fa196c9e30012b32a05c65762d5552a712
[04/12] wifi: ath12k: Add helper to free DP link peer
        commit: 05774dffb974cef9fa48ee23a2f604396c96df3b
[05/12] wifi: ath12k: Move ieee80211_ops callback to the arch specific module
        commit: c26f294fef2a4bf8c456e3d212bd7e1bd698efda
[06/12] wifi: ath12k: Remove the wifi7 header inclusions in common code
        commit: c870602510242527813843115edd31b20db06702
[07/12] wifi: ath12k: Move ath12k_dp_rx_frags_cleanup API to Wi-Fi 7
        commit: d43133a38b0ccc5e53b9efd9aa30f29f9db0b57c
[08/12] wifi: ath12k: Move ath12k_dp_rx_get_peer_id API to Wi-Fi 7
        commit: 147daefc59f007966b92e510b063d407850f2278
[09/12] wifi: ath12k: Remove arch-specific HAL dependencies from common DP
        commit: 951cca9cc68d67ff572db9de32a810a16d9bc1ad
[10/12] wifi: ath12k: Build all the files in wifi7 directory into ath12k_wifi7.ko
        commit: 219dd14992fca65c33666712939f6bdf001722e2
[11/12] wifi: ath12k: Use dp objects in performance critical paths
        commit: 96b42732bc75de66c5e10c67d6a60967004ceead
[12/12] wifi: ath12k: Replace lock/unlock with guard()
        commit: f87034a7576f918f2e60a14f17185b492e91580d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


