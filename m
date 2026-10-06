Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BF2CA5FED
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYh0A2WV89qELVCG9L3F7Oo0b5oCSOSM4UplqqLuF+4=; b=G7UIXgUqkXXJ7CNaqmdjmIqco5
	N8V8tLoKgUTEuVGZXSoS7mwYFahJgqja1CbW4FCcAoAN7VWP9bF76eEY2EXjkGhyvwRxBw/IFhKyB
	3WFNUkLthrrDF9gJppwk/96x1IQCtUUmzXw+PAFjhQi4cogQQ3+IYxZfhcSd1sWDz2YicWgFXxbGJ
	TFPMOJrdsof89qh/0je47dTaMT4m+dz7eTFtjrQapclvCBGSuCnJox6ppnGVRQp8v47xchHIsqGrs
	8gCHAoF8tuGjTtG992+ZPL+HGrnPQvdw2M1eMZsMK/hhwbHzLPk4VVK5zeu6lIsswBKvXWDSHek47
	EvuqKDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5T3-00000000swx-1sTe;
	Tue, 06 Oct 2026 13:44:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5T1-00000000swV-2yAg
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 13:44:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696DUcKm1944145
	for <ath12k@lists.infradead.org>; Tue, 6 Oct 2026 13:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYh0A2WV89qELVCG9L3F7Oo0b5oCSOSM4UplqqLuF+4=; b=HuCKxunx7gm17XRU
	92U+DCWGL//CulSXeQMUSjYLw9wfVxlasuL0soNT9B7CZDZBoc8U9yCRTex1326l
	sXC0oIVUdZT7su8LsP+E8vK1Qan/PXHrgzPdLkWY25WVFAWMj0VXJZW1wldYNg+z
	yNX7VtejEE8dNdnodhbLVLrtDIhiB49QtOIRJd3HufXWmj4w9nBcg5xQcvE2FWIn
	mbBZ1vA0/gB7WFjx/98kgE2QiIrAicO7oufwAwo6G7GNIV+J3MyDrQXS8ZXNCbKt
	Xx34V9ugSUfnzokxDhmyP7BTOMzWKas9+CW/FYEwu1kbXBYSijkwOmRNQuAdyt2R
	Tpyw3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4henn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 13:44:27 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-143826c4a13so1636488c88.1
        for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791294266; x=1791899066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYh0A2WV89qELVCG9L3F7Oo0b5oCSOSM4UplqqLuF+4=;
        b=fqnoRfoMoNi/7zn7dIKhqPvbLIrIgJyocyOVXhy/0a49oeedYcnJMBragnO2yLAd7N
         rEPg9iqiOMFilKTXkzS+UQgUVnaKpFbVQ7S0dFlyiwCZ8Em0Nyt6l+D0E3xOhhxP9l/T
         k8WOMDAU8akAQ+YtlH3vExv5d6ZErrbQ/Hf7dZXTiKD7BGliIj0qN1UNF+v+uy+kftDB
         jOatvmBCpATRfy3WH545u1aY0vO346swtCMIZEkecsOq6aDYx/fLKVJXXEL+kQB3IDQr
         06z5e7KN8zrqGEuhz5eoRGGXPRwxwHearkXHlPBR26uRz7ghtunltQ5Zb7SW5D4hPp1M
         wztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294266; x=1791899066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYh0A2WV89qELVCG9L3F7Oo0b5oCSOSM4UplqqLuF+4=;
        b=Hjh0xqsEf+jYCaJ9ZNImMmieCk730lubO9/PsxCyKTZZi+9Ov6H6t0S1yahMWr7IBI
         0AbEEfIeAPtv8bD+RANGq03A1etNC80vuq6RF3fhA5uw4KHQjm16bz/qskP0HN2Q2m/e
         qx47yBp/JbcUozCF4JK/mHleKTbSwZSHjGaOnekozWCCFKtAQZiX7gVU+HxDt+2i4fpw
         5tJHzvZiSJiZ3iuC5q5RNX45WWXXxUgXxjrt1gGuZrO5k935ez7Hhcz0PY4JonnyPVcd
         ApYbInr16hGccSDemXhsRCcRUYteHkW8QuG1tC/iyTafjT8PJl3ZJtvR6siSpYrenEwT
         smaQ==
X-Gm-Message-State: AFuF++mgv3M73SN4cFWRmQC9LDwWKUUgziuIxXZ+LyowEnn0KKhIf3QS
	8VkmQWtH6QAr14zhzIMKOVNrM7FxR/63CHwBLtEwOw9tjFg7A/NLpuQYGoQHgG7wtLhcV9Km7f1
	g4P15Bmnpcmajdt0tXmR/ZFiQSjeDlzIvYAqOdWP0C8u7y6NyIOS8VoDbMp84XZQx
X-Gm-Gg: AYBFou3DeW8Fb7D1Ou+9vxua/cjLTdsuiqzP4zkxPS7F8MN4on7JhhC45zNxp5R1VFW
	fagIaKC4ngZ7qPbYHfrCd/+UO3CNQ5KS28qQgz2TsgKL+qmMSJm7vqu7xoBDMuinF9Cnlx+T/JU
	6K1sP1XRIKjtT8z6kbPlJlVBQzUAGJ31BUu6h5oQpgolWQC2C0Tgt8Pjd2VfX8ysLo8TYuAu/4/
	FjP8LYADNcy6Pu/2hBJjLKoA7q8cL99O5rnfn3L0YZO0YSmkMl0JPmG5PeztBpBfcIB0EGGhylS
	tvih+99gS7yg6MNAKQrwZzGNnjyEWrVKH9w0oE2TSvTaeZ0JeYdGXXPDmEGMXfyFdCDbQmYnl7Q
	P3nbHVBdsfAMi/NLOuE+b9yowrrSAoT8JRBRuVvKl057uhFWnuX5lgw==
X-Received: by 2002:a05:701b:4204:20b0:144:c128:4c4b with SMTP id a92af1059eb24-15ecbb6b400mr1884823c88.36.1791294266244;
        Tue, 06 Oct 2026 06:44:26 -0700 (PDT)
X-Received: by 2002:a05:701b:4204:20b0:144:c128:4c4b with SMTP id a92af1059eb24-15ecbb6b400mr1884761c88.36.1791294265151;
        Tue, 06 Oct 2026 06:44:25 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm10148527c88.13.2026.10.06.06.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:44:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
In-Reply-To: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
Message-Id: <179129426438.4034642.2830752698143137972.b4-ty@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 06:44:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfX0Rn07kWrgXFz
 kQLPPTwrjBBLhUs9Id9rb96UiISphd+VvdaHKm91NaIaS1EQVjk2xwmyO+gTXIIj6j54QaWyBPU
 NchjuxLKjWORZceIyuu5deBzo8SLnz0+9bwrN5ZZDcP/neDMP1yPO+YhLcwbFpPKXWoNbFDG1wl
 9TsHN7wwMfIH0onsi4PVTN11glqeams9PG7VI6oBk26od7WwsVTF/g96dchnlAgpJcQ3LSpJv0C
 bnP9OYJkogpEYXY/TmIpOlC0A25nQvTGXI2cktoDxZNFiU9JF4bhfAkp0SlV+ncFgZgHjE+jqGk
 Kfk3zvHpQ/cFUVnHj0OI0ZVHa6VOvszhLaqFd/A3Q/bZ00vb0T5c7FWHluFczm+dUhS2jcDvusv
 7D7tVihCSNWgzpEwIgLBKZuVIxsN+5sMeu9b6ExGAitye17oGryWQyXuNiqOazl9bYDrkVOWzPo
 PFv92KpBAosJnfAE0Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1NCBTYWx0ZWRfXwAC18D+vjGId
 6IUxcb0DwqbmHIeMfGbwqy+eF9F0lfgZKG0BlCG+i+/418AijiO8to23nBR3vLLY7Cf0GyIwwo+
 nNlAwiM/bFxzwr3co4e2vFy6TLXA7Ss=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4fb3b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hNcc2shypapaRV4aqP4A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: IZh8nhwMSGd38lbVRt3MdeHVxu9g-00K
X-Proofpoint-GUID: IZh8nhwMSGd38lbVRt3MdeHVxu9g-00K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_064427_754559_B2436861 
X-CRM114-Status: UNSURE (   6.93  )
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


On Thu, 11 Jun 2026 20:23:32 -0700, Yingying Tang wrote:
> This reverts commit 809055628bce824b7fe18331abb65e44d02b0ecf.
> 
> Call trace:
> rcu_note_context_switch+0x4c4/0x508 (P)
> __schedule+0xbc/0x1204
> schedule+0x34/0x110
> schedule_timeout+0x84/0x11c
> __mhi_device_get_sync+0x164/0x228 [mhi]
> mhi_device_get_sync+0x1c/0x3c [mhi]
> ath12k_wifi7_pci_bus_wake_up+0x20/0x2c [ath12k_wifi7]
> ath12k_pci_read32+0x58/0x350 [ath12k]
> ath12k_pci_clear_dbg_registers+0x28/0xb8 [ath12k]
> ath12k_pci_panic_handler+0x20/0x44 [ath12k] ath12k_core_panic_handler+0x28/0x3c [ath12k]
> notifier_call_chain+0x78/0x1c0
> atomic_notifier_call_chain+0x3c/0x5c
> 
> [...]

Applied, thanks!

[1/1] Revert "wifi: ath12k: add panic handler"
      commit: 05165f7b3b9ab6817fe216c24f90755b7c5e15f3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


