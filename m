Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D1CC8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvY40f/kbhY+V/H0eCSj2cTQBJ6utnYzy2Yfq17jbCA=; b=cARHpQjSdCUQbbu3D4o2S7r1AU
	2JAErk5v/5+D5uYSIf8+IzsmPr1QdkkyyY9j2dPg/MqvIm5yKU99zPZry8P413bWXte8e0MIY1rpy
	nyaXGC3A8dMb3XlN6ofE7uQJHhoY4g8Uf5uFRxdsy7xbaZu6xAhc6PrzT7O8d1m1qNBeQMCtb0H6U
	CbP55Aq9Ik924Xxnhaxo6JR9Do/q3GvHaVHVv9cvSeocBgNRBSg7FJlw2ylAU3Lvi6mRqdExHYMCk
	DhBeBbD3OfsNen2Eelk9ZvIlXWR7CvIGq5ymQLWfeAux7FdhFK+GcHsMGJ6W8BFcJz2bCJQlbrxrW
	984GUI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXPz-00000004cCx-2v91;
	Tue, 01 Jul 2025 09:36:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWss-00000004Xo5-2d7N
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 09:02:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613qJqf002651
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvY40f/kbhY+V/H0eCSj2cTQBJ6utnYzy2Yfq17jbCA=; b=DimU2BcwXXwTmtl5
	XMHNfYLWpGEC8L2/pQEnmbsuZteFMMeMpPMyotsX+s1UXOv58dtzk1iZ67ualYhG
	wDdnvqDJjvFQky+gVY2ZhrdVDKekM8TNmiP81iswmwM6VReDLGaAVKQQ3bBaeXaT
	DR6yITir1TNB1c3/gE64t1We+2HkhSB9UUU/0jrYnb1eWJuPw8Jkdzey7aJ+S3uk
	6oylJDEzpNrrAlRPy8mWCxFlERak/LtfmJ5eXfntetfu7WRFL8zmOfnoGtI9LIxC
	vvEGF0JnK2fdRlKwGFegnGquW+mxBEFvtQy00UyV8dIqZ2ddaYxaHQawrC7dhWlR
	S1vuoQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcqxsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 09:02:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748764d84feso5122226b3a.2
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360553; x=1751965353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvY40f/kbhY+V/H0eCSj2cTQBJ6utnYzy2Yfq17jbCA=;
        b=OlLMhdti1LMLCjmW0jEzpYjzClI+LDQD5t1MP4BU7HU8LL0neIoPXkmbHaplFIhXFB
         CYQE2LzamafGfghA8Wsakfh4b3DXkb/jMq/lx0RxSMgf93BHRDCtMXoXY4U5F+GZ3cxC
         WXNHWCaG/3vq2R0HUp5u2P8h0JsEDjc8zDDUO//gBuqNXf0PxfbDlEy1ACA4CHgqoTB3
         ST1hawSAtZ4PNqoY/sxHxb89gc78oIGHvJQ7S4D78oVz5/efocdWLwu4N9UC0Y+HW0VV
         uuWK8ZMQdejzV+r7bUs8RoJZU/3GCV2I+AAV+5M2fOctLV5LOzXzJLO4aASMTJ84RIBv
         n4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU7FpjQvJTn8zNGdEDofJk1bYnM8olIGbXtOKTeQM4WHNiexyf53B1B0QREPszBWUG6Jo6m9Vk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVDJ4sBMQGUFlW6h96l1yTZEjijOklwOWO+RmPV6G9hveySxlG
	2NZSQdGlq3jgsiY4glfT9QdH8KnQWfgMjZj455ApqlVV3iiYpQ32HgusUJBRobbVmE0sSGOyYPk
	7aZtyaDq62V9bEMoSd9EeoB9l9UhyaqsreCpmlB3gzOJMMXINWvFWyWWhyfojeMy0
X-Gm-Gg: ASbGnct6zfjRVNCz2R2jHqGOtNb905BsQ+au2xtgpfORft/HgNw77LVQ0zX7CaA3zmR
	pbZTkWCettTqwJR9MIuqF8sx2+cLIC3Yy7Ny8ZgtH01M3CWKnJLyafpBfSewcBe796foZzJouHA
	1BGvKCnqsQ2D6IRSQnOykvP549GZGR474V+DEOuklnm2KF602+TJeJA55uOlYQKDBWGMmNIxubi
	V60OkkAhdQ5WqMHGeRbSLermJip3AHSU6M3MWHpo57LsXiajyJMH87rBOQrdX6SeOM1JEjhO5bf
	Y5hEoc6YyAk2pH2VkURvDtperHl9cR9T41xoyJ8fhZE3AFyrZv8Wt8hMx3pyCzgF
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74af6e3f46amr25138985b3a.3.1751360553228;
        Tue, 01 Jul 2025 02:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8rvP4tU7MZFJ/uAQEVvM14DZnqv9iSk8Sdr08Vd7uprZRbxn4m78Otz7bqeh9TOF3PhWWw==
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-74af6e3f46amr25138947b3a.3.1751360552793;
        Tue, 01 Jul 2025 02:02:32 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57e7290sm10795579b3a.146.2025.07.01.02.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:02:32 -0700 (PDT)
Message-ID: <54744546-1daf-71d7-5cbc-a18d25e309ff@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:32:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Block radio bring-up in FTM mode
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250630031502.8902-1-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630031502.8902-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rLMKzQwYqM-R3JBnz0x1u0D1LxJxPf6r
X-Proofpoint-ORIG-GUID: rLMKzQwYqM-R3JBnz0x1u0D1LxJxPf6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MiBTYWx0ZWRfX2bfccsGj9BMP
 w9CgG10l3S4ryOGpPUwZIVZr2alPs5cyincoK64xFiNSmmB9s3gq5YS/hezZkaiwbZCN8vJcLkk
 n4sdJYGfateiF5YOuxIw2Hby1Trtvk0SVgbJbwi7Ax9hdhCBB1U6o3e22Vyvkw0P/bH2Xi7SYTo
 jqOH/ouCLHMhdYeKEJLe/si6PRczpowHGCIwADRKxou7QpTC/V/CCGJ+BTtHvSiYl0sE+cyRnp7
 1zefXzGT1+i2+/HOmXEBD+5tZ6vL0y2LQAPCJqzq3iARLEf9oGBXxirrPTcY8tlYG7KJDx4wBLx
 OCmYjAIiiiQ0QSL78geHPd3HZ/YfcwoTQJr1hc4rhxstdn4zhqQDZWvLILFs8XSRiIisvjdd0yu
 sfzTE5NxDg171pMbmtyhiB6riWFFMYr/fQR6EqwmxW9vPwA840iUGU+tMpNrZETa2wOlpu4b
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863a42a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wy0no3_6c23iQZEdgM8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=817 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_020234_673002_2118F419 
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



On 6/30/2025 8:45 AM, Aaradhana Sahu wrote:
> Ensure that all radios remain down when the driver operates in Factory
> Test Mode (FTM). Reject any userspace attempts to bring up an
> interface in this mode.
> 
> Currently, the driver allows userspace to bring up the interface even
> though it operates in FTM mode, which violates FTM constraints and
> leads to FTM command failures.
> 
> Hence, block the radio start when the driver is in FTM mode. Also,
> remove ath12k_ftm_mode check from ath12k_drain_tx() because FTM mode
> check is already handled in the caller function
> (ath12k_mac_op_start()).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 3bc374cbc49e ("wifi: ath12k: add factory test mode support")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

