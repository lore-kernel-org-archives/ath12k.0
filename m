Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7501BC531D1
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AI3MNO3XdtPhdg8gY6ssE/s3qrDCtqoklZe1KMeMEA=; b=fwYmHXdm2tpDCHm8kp/cIB/uf7
	TBcY+yS9v9macWIiHLC+PlLXI0MBwWrNaxyPEm8IWFlYlvJIX+O2rfjV1B/RhvyPPMYHYOfulI9C4
	H/c3pdmk0Cveqgv53ksDXR6KUPstGcLP2qCGLURunKppm9FUklfWIty9j0iMheP2mi3/mdrOUXOz4
	OSNjIytYmoXx9O+WYFj+Q7cSzkobtRbD/aOj6ml4BYJK/64cmhKCl18IBL4ygeTGaAnEjM8co6x3Z
	EabpT6rg3AeCFvYOrBcA/r9TR4D2gxuPGl+Tca413tPkEOgWvS1p9ifZudRzTQqa1045N8FdlVKKN
	0ktvzIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvhB-0000000Edn3-0ePy;
	Thu, 23 Jul 2026 15:50:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvh7-0000000EdmZ-2rEJ
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 15:50:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvn7c021144
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 15:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AI3MNO3XdtPhdg8gY6ssE/s3qrDCtqoklZe1KMeMEA=; b=Mb25WlijW0N5/+ad
	5wcpk3NPwQ93Hn/3bfL3HTTO3hQ1cAKMYsJdWhtEVTNPnnZ8BB7Vp8R4eqKTLYrH
	D8guvPZr/anxelG0lb+W6zbWztyFtVr/eagr7ORgC06MONImfKvfLqlEE3C2Lb2u
	TZoiY51iLZxDDqxs6lDSys7pBXr/bjFL4uczHHfYA/U/GUthA5hkp3yxt/tuCmUu
	KVyVyY0l6Bya4/qWv0cVqUpHQchFTQ7rSFpNtTCEuaL57K6j+yY+LDhaEJy3DGRh
	Xt4Q4NFj4KaCqGXaMytD1n+P6AQ39h0EDlxcFKrytKXvHKoRaoRbsThHO0bF7vAx
	oid8wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7m067-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 15:50:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cccfa32670so11249775ad.2
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821844; x=1785426644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AI3MNO3XdtPhdg8gY6ssE/s3qrDCtqoklZe1KMeMEA=;
        b=HsnM1zeQ/x0DatvP656wcVASavVhyKrE0EsSCpmPMv+JGOhkGHTQmGK9NGrUrq6cbd
         EmW0u0Hz99lHD2OinlhM1i97ItCfjko0elWE8TIDtxMfzDjvSXyckY88yJjg7kDXnKCl
         HaDdgiCCUl0ir1o0O8c6ErsBpgpbNsW+UyFcP4iKARdaXsP+nmzoWS0V0/Y36AdjivZR
         GZg/7e68QSsonf/GA9jZ89hFxUspeAVDiEZ1WOaEoM/ltteRg6m5qxS1rtIlETPhO1bL
         i1xmUXAflONH3gcij9RIWSCoVvv+bg2TMS9A4D5XfQzN7d/Qq2OOHlNKIp7gm2NrhojD
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821844; x=1785426644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AI3MNO3XdtPhdg8gY6ssE/s3qrDCtqoklZe1KMeMEA=;
        b=CvsT7JIRHUr8K8W5w4/6MxNQk5M21O/22H0LAQJDPqIjvKHwz9s4ERYUvJu1hK8RsN
         EXk4u4joeZyuo4Gk77/atAebWHNAYaKVQp/60wUKgmQPZl9Dr7rk/wLKgIv5UeUl+0uE
         j+MBVkZh3H0fcXNHBPfViJjuXP4uM+CdF/jbRWypVUbML3CvK2lNK93ukdBcydFP8b52
         p7N4Rjuoazb+kmk3jzUuA0yvjxuU2P4WXNlRkCKSPfbH9WTrsPYzKX0A+PXFXhIt8ASE
         lREYO53h23jJByI+ozzCLHsUbrtJTTjJh6RCS3ew1agV2Y+q9tah5bdiRE/v/CisSEQW
         e+Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqpVtcZYnpYrgfzQ1NU1T5M++wxBbPYWmtTXHwsay0MYbdM+iZW+VWFXuitoMcdGJU+9fb/Jnw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpgK9RG2Box039nQQ1xvD3zlPm8RW5vC2Rm0fb6WV/Kpnbepmw
	Rr9nxLysZtGgZNaGMHtKu4aLpxgrNcq89R1wQhF5KM0CvPkY6OsnSABv0/bMCaNzit7/SHg0I45
	nxegcUvoDUO89ate4QeHRjIyje88UZx/1FSXOl/Yq851v1y5k6asyvxKA9Saqc9ra
X-Gm-Gg: AR+sD1065sbmNbaxdJnjIwFjHGDsdcV9MAJcWLJuq9synUJ9VpOmsC89F6SQEyK8IZL
	AMCJpcptOSAVlzeeAtJ2ibDAHAV8V/PPvKvW8Byn20W9J3xbql2BqLwwvU1cpsAl6VSK60wXHly
	Pg6nxvJeng5uRYjpcqB/pjnM+CMkFJWP1JUY/IqWqfpFoWEqYYuh0PtWfCm1cAvy1E8Q6UCT2Lr
	iDHyPKG1wMwl2I7Wr8Uaw+zGArAM1m1ovAd1Busbm7ruMMbphXpZvjgOt7R/b4uVJhZikLKOQXr
	Ir/vtC9Gi6KaSee9f9zDfq7ljZSj9++f6HBXiRcYYHNDrWKlBSZ7HvSyC4nFr0eVKBJvTtxtKXS
	tRm4t7qsQGhN3xRaxWk9mEIID3+jXJFyFUh5K3aQWLQ/MLPMlAIXvOxol9A==
X-Received: by 2002:a17:903:3d06:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cfa6d86c4fmr40575695ad.35.1784821844378;
        Thu, 23 Jul 2026 08:50:44 -0700 (PDT)
X-Received: by 2002:a17:903:3d06:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cfa6d86c4fmr40575285ad.35.1784821843714;
        Thu, 23 Jul 2026 08:50:43 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm25698810eec.30.2026.07.23.08.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 08:50:43 -0700 (PDT)
Message-ID: <e44df9a5-651a-4ef5-9bdb-626c845dbce7@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 08:50:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2 1/8] wifi: ath12k: fix out-of-bounds
 clear_bit in ath12k_mac_dp_peer_cleanup()
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
 <20260720-ath12k-fw-allocated-ml-peer-id-v2-1-630632758a80@oss.qualcomm.com>
 <21084de4-cdf5-4a99-9e0c-da4db067e4f9@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <21084de4-cdf5-4a99-9e0c-da4db067e4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2zii1OIFHCseOG52a50I7g7iG2ihez0P
X-Proofpoint-ORIG-GUID: 2zii1OIFHCseOG52a50I7g7iG2ihez0P
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a623855 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=67VretDDciP4QXt5TvkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfXwDJNMmjs3I6W
 4D5oY69I1EGeKxP9sU4XY6EBXvpL1+9rxHl3/nqmilLn9MjPliK0XlChzZPPDOCG19LQ3BK+/7H
 mf6+MDtJmrpQFRR8DXMsHKS1tP/+Sgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX3vK//nPDFHOz
 2RQ1Hmlfx3h14q865fDM7STCy0PzWON3h5QvzsTWSNI01Eq86NDUrhJhvSwIxRbBKlGyvM6XxDc
 8gIal3kViHhUMEyKfnkxPUirVlsD+j5Vp30k5fAvfJZsoLoDssUaIRf+JbX+67dwnPD2JrbEhNU
 AHsWgxY7/zWna1RnXUHgLo5hPUhHUBNyqQEkCIkfkF+JmEfgKgmGEDdudNNwRwnLnpKqRkFy5/7
 G8uiZJ0HnKrwjeSLfg1DMORNIjKN+1ZJkkmUrVCUjlJwxDhVH+H1tJxR/m7J4ofo8hLh6fxSAgL
 tR9U2lekA2tj9ZlUM4Qzxhjhj3GDN/bMkxpJZSn8LpzdDixaDUE1gMjFgjUHJt2WIjMUp4ulvXH
 OtA6ThynQvnwc10y5D5m9FiBmdah36OVBZ4H7sotjA0o0B40BhpyDaMtO6r6Ex+LemmFDh/v2DS
 gCF4iWGDxPC/AJgnAQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_085045_737401_1BA25D88 
X-CRM114-Status: GOOD (  10.38  )
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

On 7/23/2026 8:45 AM, Jeff Johnson wrote:
>> +			clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
>> +			ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
> 
> so this now matches the code at the end of ath12k_mac_ml_station_remove() and
> in the cleanup section of ath12k_mac_op_sta_state(), so perhaps that should be
> refactored into a helper function in the future

which I now see in patch 3/8 :)


