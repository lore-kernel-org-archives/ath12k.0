Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB06FCCA476
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRlbDJEHTq1pqn85S2o8iC1FTXfxAiiOIzfqlh9613o=; b=scJMmGgzwhfw1LpB7zsjpOla3y
	Y3f19m2hXjqbGC9ZQHnp3Nzk/8a3bEUZXBwxIQO0BGCGlfTK1ZWMtGRbsWR5BK/fridA5P7uzU89J
	oR4cllXwS8sEM//SD9dB+J/VV0CUE4C3qYquTnJRRHhlCLTPwxwvH0kV3nrbZjZgQJQ7clrPi8ikW
	Qs73k7KedccRvC5zK31KZ7IaigMzQGCU5gp0/I9SxlVy15s1Iz1UW58na9I9Z83YmN6QfkGL86+Qk
	WuBW7mOz7lQR6x7J39K/hZmR8iHhsfF5yQdo/fbZEN7RknEv2gl2y8LWIT5KV4fkXpjQm6Gi4Qn7I
	kLNALZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dp8-00000008d1m-2MmU;
	Fri, 10 Oct 2025 14:10:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dp7-00000008d1I-0f7K
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 14:10:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WnLb018966
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 14:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRlbDJEHTq1pqn85S2o8iC1FTXfxAiiOIzfqlh9613o=; b=DzhfYxZ2WfALpOu8
	5KWOrwfNyH4CdmEGbzy+d+dod4o1wpTigDp/q0komG0+WtPbn/SS/AS4DZfFYgkS
	UDLNEUi+mksFkPnhNKWCUPKUl4P04DiReFCbcSflvopGCruDyQX0CRcw8FVEHQzo
	Q/EiIWEHOSQEQexnYpOMvuiFI9EEz7jJMIciwuujK+hWpD2h6kFkoCErcR2Z2yGi
	7n+W1K6W8r/xhUU2hBeIBRc5TVGZaaV5jGbbt13RaQ6w4WcgXnbWFQIkRHjM/T2E
	VzsB28SCNTvCZj+G1AhZ9yele/UG0X0OivJvVCH4VtwAObJiHf6O/Mekugu/emWr
	DdJxnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m6nax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 14:10:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78038ed99d9so4801353b3a.2
        for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 07:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105420; x=1760710220;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRlbDJEHTq1pqn85S2o8iC1FTXfxAiiOIzfqlh9613o=;
        b=qG7p8jV5+EP4+1S4VvvGuyWLnVT+Z7Yo68MVK5PQPaIirskjAnrfp/MHbNV/p+cQLp
         aUUUHsTq9w8nCStMr1Y6QeqkPbCFvxZxSom4ljkkVSweYgUMCWUXbVQFOD6yziyYQsBa
         KcYpgR+X3UNCRhrJHQE1ZYEOJh6bsVmukC8ge+pXZH8GxxVJGv0NvvrvDB+aJGdIzHwe
         lefLaFJ9cl/2F8yG4jIFIZJaJOr/2yvGEgz7gA9eoucvE3YtY+siPeme4LrbyU/00TCU
         ybwMrLYMKg+UM+WYsKZPshyHMyRFNwtaWKccpF0V6cLLfY7R5cjQ31nflE8LdKTFPkiL
         0u/Q==
X-Gm-Message-State: AOJu0YySZ6nLPZw3rq6o2XfjEhfRayn4LPRVSZaW+k9HdPRn7JSrNZgf
	NptnpY5PqkHSV5OexFcAzn30bCjN/DJMkoZUmjI6EHqRUME9rHLHSOF28jgKxopYX6C/UzXmo+k
	sC008j/W1HHu/0zwhSkuPUzz2mNcko4t7nAEqgDt1ZlXxoFSKlWbLTLHcObIzaIp/
X-Gm-Gg: ASbGncsQwGO7NPcrp5YAiRLXqGHO413T8JwElRrt4JnpWNfWAqJKu74GYLW1aDdSAV7
	objSNZGGqL88FOTAciir+fQSLpgiSJW1sJQE1m84yZ6tVKVaA9bhyUccbpSBICyv6EeD4wSUyOH
	x+edQLkmzFX6VRxvwX5CFhyh4Iw2LwqJHDPtvnY3QrIHWNZCIZ2NVL/8djbVwr6mdweTIZ3YXTv
	2lvJ6iGNpcdWny/RQ7J1B4Wc0NX3C2rKt66SzOM/e8wJtvVV8JaaNRi5WhCXCTULbT0qjo/+fpd
	tf22NGe0Dms2QuokkL+fKqxlNvbEAL+jpsZKaIwJPCfu1rW+BP3O/DaY6gvURhEImGPTuSjYk4w
	p
X-Received: by 2002:a05:6a20:12d6:b0:2b8:5f2d:9349 with SMTP id adf61e73a8af0-32da8453c08mr14981550637.41.1760105418106;
        Fri, 10 Oct 2025 07:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEL83cQq5vBFhOPGj7OfdX57vOzROPiTr4/rVfcVPJdRAJMb6orZxnkAHQO5uYwhamP6xp4Q==
X-Received: by 2002:a05:6a20:12d6:b0:2b8:5f2d:9349 with SMTP id adf61e73a8af0-32da8453c08mr14981506637.41.1760105417615;
        Fri, 10 Oct 2025 07:10:17 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df8ea31sm2447948a12.42.2025.10.10.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:10:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
References: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng 00/18] wifi: ath12k: HAL changes for Next
 Generation Driver
Message-Id: <176010541694.1798640.7649833428489810940.b4-ty@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 07:10:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwbhWjPaIAWKz
 5clwrSHOcm4S+4KWqMCEon2VMRadTMdQBaHXcWV7YCptNaq1C5p5DtpnAxdzrbbsOjVnG1r2UsO
 fyWtH+5y3X3uJMxHiThmJm3jiEEGuJ0bjIapCIuQ9w+7BdFTVSxqh3qTf/1U2cm4y9fjC+HAR86
 JEEBFfe9U9LyG8uwTOSFF/pdTiC91apXaCn7cDJuutPAi2cSo2uKOjc2Cskd8L4jab//g6oeQqB
 ThsOCWx/PO5chXSm91/vDp/q0X/Mc+IXtWrgv4mt7uGfJAmBaKPe9kAdNNjGjsw4rSUYzgn0zGR
 /suTLQF9Ym1uPI4h4m0IpSnpLyzUS6EJFdIzJR+WOXsi47GWH2s24knTXcAO2kNPypgu+m9PYXY
 20JCxyudSpgDvW5zGbOmjRbGYfxRZw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e913cc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=nUlrOwfnRBZjULIfKVIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: KPSbn7o6eVmTfxIaU1oIm2G6vTIbH5EB
X-Proofpoint-ORIG-GUID: KPSbn7o6eVmTfxIaU1oIm2G6vTIbH5EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_071021_204057_FA61174A 
X-CRM114-Status: GOOD (  10.26  )
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


On Thu, 09 Oct 2025 16:40:27 +0530, Ripan Deuri wrote:
> The primary objective of this set is to modify the HAL layer
> to suit the multi-KO model. The HAL APIs will be implemented
> differently as required by different chipsets and these
> implementations will be abstracted using an ops mechanism
> (by registering function pointer callbacks). The hw specific
> implementations will be registered as callbacks in the hal_ops.
> 
> [...]

Applied, thanks!

[01/18] wifi: ath12k: Move srng config and hal_ops to hw specific hal files
        commit: c0600b35e08db781511c2b35af2d2ec58bbfbdfd
[02/18] wifi: ath12k: Initialize desc_size through hal_init
        commit: 74ed243dad18366aeb836f40b921758e20d9d5b7
[03/18] wifi: ath12k: Initialize hal_ops through hal_init
        commit: 369cb192c2ecf1228df06adcf1aa5074aecd2902
[04/18] wifi: ath12k: Move wbm_rbm_map to hw specific hal files
        commit: 1c1d4b491d2085f6bdea90b0e021abf8e30f0457
[05/18] wifi: ath12k: Move hal_params and regs to hal from hw
        commit: 492dea1892dacf1c1ee356c60465e7fcdc18cc97
[06/18] wifi: ath12k: Add direct HAL pointer in ath12k_dp
        commit: a337bff1db715e67135a2e5fcb6ecafdcf81f8b7
[07/18] wifi: ath12k: Use hal handle instead of ab handle
        commit: b38213660ab9ebf9d32db40ec0ec6691b6dd9d1a
[08/18] wifi: ath12k: Move HAL CE setup and SRNG related APIs to wifi7 directory
        commit: e9f00e22963e809a35999465036d3f58b126c1c6
[09/18] wifi: ath12k: Move HAL SRNG shadow config and get ring id APIs to wifi7 directory
        commit: cb419f582f36873d31368835be34ec1500792dcb
[10/18] wifi: ath12k: Move HAL CE desc related APIs to wifi7 directory
        commit: 3d947cef0a51e19a779b201fd27885b31af19383
[11/18] wifi: ath12k: Move HAL CE status and set link desc addr APIs to wifi7 directory
        commit: eba935ec922fd77a88ea2bed12d929afe340ee19
[12/18] wifi: ath12k: Move HAL Tx, REO and link idle setup related APIs to wifi7 directory
        commit: 356942d328a4d85969953353b4b9c1f0934918c5
[13/18] wifi: ath12k: Move HAL REO and Rx buf related APIs to wifi7 directory
        commit: 17540a7c9b363e08eb417ffcd25c74226cbb131c
[14/18] wifi: ath12k: Move HAL Cookie Conversion and RBM related APIs to wifi7 directory
        commit: ea23813a2e442f96a05d3d2ddf3d42c6005b1862
[15/18] wifi: ath12k: Segregate the common and wifi7 specific structures
        commit: 2bb41934527d3b132958e214d688cc525d0088c1
[16/18] wifi: ath12k: Remove the unused ring inits in wcn
        commit: 6250af6073092f25bd2c104156e0808c03adb5b9
[17/18] wifi: ath12k: Rename hal_ops to ops
        commit: 49ba5debad420506eef9fcef38d1fdce41010901
[18/18] wifi: ath12k: Drop hal_ prefix from hardware register names
        commit: 25122460e7f96864a80b59ffe6c953911516d3b3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


