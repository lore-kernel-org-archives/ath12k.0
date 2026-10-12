Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386DCA9ECF
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqFzJZ+6aY9XoFhD2Cu6xQfyOtfvQBfCUx/gOqgZ9JA=; b=f1KvE2DHLrHOEbvwCfq3cLtbAy
	29eZiJNkxriLwWYBQuW3a32vhVYYn1h2yFCuGsU6nwrZdpj+tvarN85cJIhGRl4aLf+XzLuwR5gQi
	mFQzlndbJLEB4chl673peuPs7XTWmeqmS2FXj920tDHai09Bx6czWKWmvttstrebYavmbiuSnUBjU
	7K4q77Nk0BbeAXs5RDNTELVRVqYAKPaBwC2lZIq3C9vVJJJO2wvjWjL/RzWBYzPfQ2Krk3ze8T+Vi
	WysZh6evQRGbvClMmA438kfA4fTbGblWxuzUcGWQ22Y1l2pOw13K4g0OU34EBnQZmvecgPbeHWIWc
	FeVBGoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG5eX-00000009ZeB-0yCE;
	Mon, 12 Oct 2026 02:20:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG5eU-00000009Zdq-3Cl1
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 02:20:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lTuQ734438
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 02:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqFzJZ+6aY9XoFhD2Cu6xQfyOtfvQBfCUx/gOqgZ9JA=; b=oFLgV7oTqcorUTKv
	+ht+1gwSBY3ZIDV158M1ey9S0EozLKChPRGShirZ7zvnEBlLe/8/qdRrBLp8UfYA
	wFmhWRP4m+Okpe4KKkWGk7IzIbs/U5EuOvZT+gdTcgqy3yRcI4wsYO82X9Lz+cO6
	qaF5JBY72MRsq0SOFR1BHFY4PZyJa72bzgW1/Zz3ec7e2u6NPpVobkBsFtoFt8kE
	nhyYskRQagEXFIYQZQgV36grZ5Bsi08SP5eCNeQitYAHvwUWayx5K9lMj4uw445M
	FqWIYgxGQwv0kgqhsziSvFQS+ybzI739IwJLOetrPHyi1oyRpjYyZ56WXO8GhWNY
	NRtgAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmvs0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 02:20:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso19036895ad.3
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 19:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791771632; x=1792376432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqFzJZ+6aY9XoFhD2Cu6xQfyOtfvQBfCUx/gOqgZ9JA=;
        b=Sm23KPEGlaHiN2zgOG6AFJPHVGtGxFLnCMbFmqUjB9gcdkrv9Rffa8F284UNTpnfEZ
         omHgDLn8KHHtkN3pviWHqE/M0yJpUvN1CuPzI4kQ77cOoFamZ+aq2hAVp9gcy96r2GWy
         r4brt0FLsbnucVylxo6tyLQhdDsrR3bm8L86G7UFwhf9d2CcHPWkWGBIlgQMJOHwQnV0
         G6HDJkJdtEe4oi58OXm2xfQoNhfDqW79miAGWvjHaf0w2iJmWy6KsFgt3P7UmI4/3pK2
         mPEI/Rb2s9ismt3H2xS3VnLkH2EdbojVTv8auCAh6FZYHDPHCbABi0vPyDFUtM/y3+d+
         z6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791771632; x=1792376432;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqFzJZ+6aY9XoFhD2Cu6xQfyOtfvQBfCUx/gOqgZ9JA=;
        b=PmjY8OKmUSLfpvDjz5137NoATXnj6XUlsJZ/BhIrp/valhSPmqP70ZDsSsN2Nly8T4
         EL5u81w4fUQZYEH1O3MeHMd4WFWRHB0NcFpFMFRPbjRr7pPLG21m2TmF5jXutHQNqbTd
         KMUBOEAUH5Gr+1JgqcLjN+aGdbbJfwdFsv0WFeY6q/wApQAj6/9fS8fjYKys/lT07igS
         4jxpnKRpZDlaCIOjHlN2080JGDJx5buoj7FZH9GhrUgZSdZ9wM+jSIXQxYjqsuaEm6bS
         u/CXOylAF9/vhI/ES1lcXWWMjmoA21Z4u/IGEQqxRwAAU7wTNipCoxQC2XaDVz21Uimr
         GyaA==
X-Forwarded-Encrypted: i=1; AKwUvBz533Frz63r/N06IVhr/lfG1whJitXWnUCOlMPIy0r0a8pSx7wv0oEFe27qLETbhhd5Kf/GKdk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+/gS8GsMlo4fTz5bhnSFS1moIzP74I56OYVYL1BbXT5VHWSj2
	+MiX5VCBPkKykkdlIQp1tXhPDSFEhq8v170ZQCo9BP548eTpg1J9oqggZkEjbA2uFwdql34X6DZ
	1lagtjS7q/zQXZ7zkHcbCu705gwnUgv4vIH6bMzgbF1TNF7aFbMwnJrFw49wtoBBa9olnPotaKN
	8=
X-Gm-Gg: AYBFou3/Boz+p7VtUejloAYHXFX36TjogulAMqUvOxWnfqztO35GkKBZFSvMe9f6rCg
	XA5bL8sUQy4HurC0ezeKm2meK1ExLSWmjsq7J3orREeKt2SjQYvBnZrJah1eKkj4MrdLTsgaBtX
	7/eYQlhc4Wg81xhVYPHn7r0OZqfF0q4YhQsLKYTCfz5q8/hGovg4OsNggujHgMqOPbUH3y1RAHi
	dhGHCkNDl/Kreghr6Jq7uPvVT8Oy0JC9PdIhWzytVks5RTHeCNFgRGMwKswxtXPKFuylBsRmTSV
	MFKClvO8w+Xa1YXD6JdJHyItcu17T4vTfVgNrVG0/MTZfuVdjZa9sYVPQj9Cf1U7P85irXAIdCo
	QOZrz2DUJ7FcEYI1YlqBwHl1JGfIU2ac=
X-Received: by 2002:a17:902:c946:b0:2e2:c90f:968c with SMTP id d9443c01a7336-2e842ce4136mr67715255ad.44.1791771632136;
        Sun, 11 Oct 2026 19:20:32 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2e2:c90f:968c with SMTP id d9443c01a7336-2e842ce4136mr67715185ad.44.1791771631670;
        Sun, 11 Oct 2026 19:20:31 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm38639175ad.79.2026.10.11.19.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 19:20:31 -0700 (PDT)
Message-ID: <d845c3af-bc5d-4aa1-b04b-1030ea66d734@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:20:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-next] wifi: ath12k: Add EHT capabilities to scan
 probe frame
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
References: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAwOSBTYWx0ZWRfXyYWGSeJR1yQJ
 HgmNYxfcYueQDVnem+xPvmtSqIP0lDp01EoJVJqrE77SmIIw9+whdp2f4GBkNVrZU3sGy2Pg4Q+
 3QwhPetYZdTLKgDIgfPy4iy4m16zxqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAwOSBTYWx0ZWRfXxjJt1Af+N/I3
 ar7atscCyaRg2Wor8hYOHEv1T9BLVhoZsXfPODO9h6RSyg4/v7xQZeT9wdoun89XvpIdxSKwe2/
 qhG6bb/TT9WBhyG2zKJruR3FQptgG6GTgzqv1E1+IDdrsxk48nw55JnXVqOQ9YX33Uop3jsFMuM
 tS23Xyj4Ye2X1UanQ1d+TbCPRki7jXxbjaypMW6qo2hqwSM0vFWRyuFwPyTXjCb86C/bn6EIP+a
 RzsqcV4TDXY6ap8dSYfWk+cD9Pqo8Z3PqSgmOWXXkeycsxgMdd+qpTJjCjYQGPvZNchF2oO6hSz
 0acQI3HAUNoUh+JA7sSCLRqFMLO7rky6nxFbrzB8sQs2U+uMbEje4B7jit7YcrQ0FnzZ5po3BVk
 kWiu5CnhRXEUjVWnggFSndx1gNvmmX7SEvv8OU2Ksxw9RkZB/sQL82CXgqzuaxXGSWcjLfrjFsz
 KEa8GtmWZYAwuClaBTw==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6acc43f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QV8Wo-qd4fzodxduY_UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VetcZqopilCsafrkAuAacat3qANzXcp-
X-Proofpoint-GUID: VetcZqopilCsafrkAuAacat3qANzXcp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_192034_929259_F04C95BC 
X-CRM114-Status: GOOD (  13.54  )
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



On 10/9/2026 5:55 PM, Gaole Zhang wrote:
> ath12k hardware scan Probe Request frames do not include the EHT
> Capabilities element. Without this element, an AP cannot identify the
> STA as EHT-capable during active scanning and may omit EHT-related
> information from its Probe Response. This can result in incomplete scan
> information and prevent userspace from correctly determining the AP's
> EHT capabilities.
> 
> For firmware to include the EHT Capabilities element in scan Probe
> Request frames, two conditions are required:
> 
>   - The scan channel must have WMI_CHAN_INFO_ALLOW_EHT set, which allows
>     firmware to add the EHT Capabilities element to Probe Request frames.
>   - The EHT Capabilities element must be configured on the vdev through
>     WMI_VDEV_SET_IE_CMDID, so firmware can use it when building Probe
>     Request frames.
> 
> Set WMI_CHAN_INFO_ALLOW_EHT for channels when 11be is supported by
> firmware and not disabled by ACPI. Also configure the EHT Capabilities
> element before each hardware scan when the element is present in the
> mac80211 scan IE buffer.
> 
> Firmware retains the configured element in the vdev context until it is
> replaced or the vdev is deleted. However, ath12k scans may either reuse
> an already started vdev or create a temporary scan vdev that is cleaned
> up after scan completion. Sending WMI_VDEV_SET_IE_CMDID for each scan
> request ensures correct behavior in both cases.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

