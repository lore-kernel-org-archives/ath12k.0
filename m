Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F45C531F9
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih8aiOXSxyRAVJpiWr1ShDgA8xOscoGGaV4GxkAfiio=; b=P46PEtk2S76P4jFxa3QYHjDedc
	O5jNW7EYn3moIy+PSihl/BcQLrF64MPo8AmyXuicTkI3FUncJyB+JVNAQNLdxhzloaOiYWwQGWP7m
	aIgiClMX7r/bHRyiSchX6rnf/nFCnVE+WNAoLg6NZYCKLhigDGkWUGXS3e8kXau+XZ95/WJwdwIny
	Gmwvgb4iUl3gVOqZSCmjIZ8H1u32HYZZK/Q9xKWMu+7QVqTBBBal8jxTVvnUw2rqRpXSunVgueGtc
	/WjQbH4E4G5c8FAZjC+DZkB4IRr3RDFQOV6h4fL/PzqG9Emm+TK7SoO5TB+hLdKafOsQKN1JdmZbH
	YrwD9hZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCCV-00000001swp-1pob;
	Mon, 27 Jul 2026 03:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCCQ-00000001swI-2Mt4
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 03:40:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fmLB2466591
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ih8aiOXSxyRAVJpiWr1ShDgA8xOscoGGaV4GxkAfiio=; b=StBKxDeR5hArvpRN
	D5WL/pn/QO/7u8CWlyMw7qJYZpgvsvhkIHB6eTXiUySagNWzibyDwyUy9ebu49n5
	nJEg8aTS0Q0dsscnO2exEiiBm7/UVt63yb/uLY+zkcX2F6Eq7VNPgjD93tQU9XXc
	L5emFxap/oaC3GOULYhQBU/1y7/bvwWiwnRaykvhs5HciDqS/MijrWfqxieYAp5Z
	n74KDuV/E38NYdzFSAcbFgzbaxJKDNduKAtFoOELu0IzPlDihjEndDpg2G6bD1XF
	kJQxs4Ige5pgrKeTk/4jCwvcg6yVliXSF1YVpu44tSEQS6JYA4RkuSEBnyF0gFWX
	y6GAOg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574hvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:40:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so3569331b3a.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 20:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785123616; x=1785728416; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ih8aiOXSxyRAVJpiWr1ShDgA8xOscoGGaV4GxkAfiio=;
        b=D2yF90WkKD9qoQatt3PR0xw+hwaxCNSzAxFaL9+S/3WqtRV6bu7oO112VmZHB+l+T4
         POAFkifEYgKQVjo5lOzZ8dLY0+Ri+5rnsTAOPul1vvcVzveL6QGVsWyT+/7K98OaPdhU
         pBbzELT7UQ6bw4rhfFSWJdZgemJY22NeYQ/GbF8gpXuWnX3ShKdvFA6BW4BUv5W47jH7
         KIY2zRQlOIZoBIE7V2OwhYRU28WM59Vxa8r2chlt9HDdzPqfLKPTzHJIVOTUShGJupoQ
         w607J4BrUTBlUalrEAKpRd8SZK9QzzdL+TYEdccXy8wXw1McQQAtHQsyss9zdzuDnF9l
         1ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123616; x=1785728416;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ih8aiOXSxyRAVJpiWr1ShDgA8xOscoGGaV4GxkAfiio=;
        b=PLK89MIHbzG5YgkduUf+Su7iGNZO7eydumlqGDjVXBRnInnGravyOwDi70wfaffGv9
         saBNCdPyWFD+6Htp0NfIrWTmiG50vtK1AI2f1dzphPwqKX9gsX5t1/nqAUj4C2MDXarf
         6I76rgKqA5yjy9YW7jwpfBkAm7ah2qLPysyGsbvCMU0mCrnWTfbRIyNhi4VDhewhbx32
         ao8mzpGSOb+LRYW9ENINJEbgFjRtNZgHKhe6BazW6l9E6c3IuL0s61k9ERbdwDGEE1DL
         Jihixdwb7v4wVCo81zFHBlZX4Tk12xRvq9auty9SGvqDexvXb7meYYkTum63DkkIv1pm
         dyjw==
X-Forwarded-Encrypted: i=1; AHgh+RpUHX2VQLdV7q7/1qEwnfk33NdM3Y/3Mt4K/VbWA6N5hfp6R9XU5yf/x6rEd/p90Yiij1guD2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvHAJvqD8xulee077a1dgidlexthrewDmlcHdEKCTn4ZFBYa7p
	T9g3eAYqfZfa888qoNyHYAVUI6vdC8IA26Fdn+Pfy2/44C3VLGaKYEwL+3oVVQVmz+tYiT3Kg4Q
	hkgN2679cg55y/DZdt6xVy/j6qJB/wgqiizwmI9OXw70xk9UkY71hgWvlDrKh32xMqoCA5FcH
X-Gm-Gg: AR+sD12vig2kZWiLururD//hEqM9j/BTcxnh+YjNwQfZPR8lL/oqujzWDxHXB8OPoe2
	zmPg/b/MZTp8VL1r5xXj3hQFJLfTKMjlISzyYAnzehtPL7bPoJaj4V46Z12MqQ1JOSGTgCaBHil
	R8QnTI6wBe6st3J9XRcSKN7QiKW7OfV/iVHTR4Zua2vgMSCFRV0/hU9ftauqYquU28+hbU6Ekoh
	KD6+v9CyZe1hKcq3jWppKLMxF88yp5iFUWbvmcw2ZfHBmJNworHa33nxvg2LmnnlL5PhQvaKS/8
	hAMimVWarfnyE5T812XIZEd1dbtJggojt1kN7cU95mTpXUIdxynn7W+j36/Jn8X5sPvucAf6vEK
	YPJLZTAsw9HaMOt7AR2ZZbJq1T2gDdcU=
X-Received: by 2002:a05:6a00:6c82:b0:848:5417:c41 with SMTP id d2e1a72fcca58-84e59575a21mr4611981b3a.30.1785123616031;
        Sun, 26 Jul 2026 20:40:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c82:b0:848:5417:c41 with SMTP id d2e1a72fcca58-84e59575a21mr4611961b3a.30.1785123615610;
        Sun, 26 Jul 2026 20:40:15 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1637sm2332122b3a.33.2026.07.26.20.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 20:40:15 -0700 (PDT)
Message-ID: <84c2ed4d-bf0e-4359-8c1a-b7a55fabc564@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:40:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Use different RX release ring
 sizes as per memory profiles
To: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfX79Jln8vSs/Dz
 jM3BpEmkkaWBWUHGr6JiIag42bI9d0ngoteLWDyIrxyWO3n8PyzkyUNJ+tf4VFWDVfqDSmsReBs
 r/O0QmbRPI7ZhFHxVDbYjWOOIWuTNrw=
X-Proofpoint-GUID: tSL_6boWxP_A4zDVssAjj9RAzFjGUXdR
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66d321 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=32pKNZ-c1SNXjFBoJ0UA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: tSL_6boWxP_A4zDVssAjj9RAzFjGUXdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfX/Ab+6uNja4vr
 1M8erk74xZeBMLRn7/pdI1C9CwhBkgoBPUaYgarfmDR0wVmDdsXtiRPkWZoMDRw8kZwY3NnHg3W
 x0Myk8R8q5mY6PLx2kCxNThHC2y9Y6L/PdUVcr8B9IAgcvmPDjDUapVgWCmJmsmkAiOxDj9Glm9
 sx87xJxaDbb1WUi1Qq5031HjGou0swpy1GcUrpaostjPCs1J0DwO9mOPrN2OAVPQNXdJPcHxNzG
 EKRAwRmKThoMGXrvFN1yz1jZ+iv5MfxAiLDAtRJTs7bUHac6clCXI3/ZQMgNHP4xTM6I1qFhNJL
 lS1AduipR+1tWVLDiDa/QT6nQRw5SojKON8nNPfxEhMQI4FJ3yMF+X4EhzaHZoqNbWPqbGM+xMb
 3hYYsxawT7Pwq1ngWSx2UxXBJ8mYEG+7dvSPewtg601hpv4SFda06PU9J0cusFpMx1XEq6cWOPI
 OTosXohyGtyT9XtGuPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_204018_728325_0DEF6E76 
X-CRM114-Status: GOOD (  12.76  )
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



On 7/21/2026 7:04 PM, Pavankumar Nandeshwar wrote:
> Currently, the RX release ring size is hardcoded to 1024 entries via
> DP_RX_RELEASE_RING_SIZE. This value was sufficient for older generations,
> but is not adequate for Wi-Fi 7 scenarios with higher aggregation,
> parallel processing, and increased likelihood of error bursts.
> 
> In Wi-Fi 7, a PPDU can carry up to 1024 MPDUs and each MPDU may contain
> multiple MSDUs. In error scenarios such as REO out-of-order (OOR) events,
> a large number of MSDUs can be pushed to the RX release ring in a short
> duration. With multiple PPDUs being processed in parallel (e.g. multi-core
> or MLO scenarios), this can lead to significant bursts of descriptors.
> 
> Field observations have shown frequent OOR conditions and back-pressure
> issues with smaller ring sizes. Increasing the RX release ring size helps
> absorb these bursts and avoids back-pressure in the RXDMA/REO pipeline.
> Without sufficient ring capacity (e.g. 16K), back-pressure was observed
> under stress conditions.
> 
> To address this, make the RX release ring size configurable per memory
> profile by adding rx_release_ring_size to ath12k_dp_profile_params:
> 
> - Default memory profile: 16384 entries
> - Low memory profile (512M): 8192 entries
> 
> The larger size in the default profile improves robustness under high
> traffic and error conditions by reducing the probability of ring overflow
> and pipeline stalls. The reduced size in the low memory profile balances
> memory usage while still providing sufficient headroom compared to the
> previous fixed value.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


