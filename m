Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229BCC369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 05:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=; b=u36F7/rziSEM3d5YSZTA0M1ddm
	fgv2WdGxO+r55ZerclYEewjrqz8KtKzEZxjGkWugXSsCibjuAZXQJr1C2KavTVQAsH88wsIYXdwl8
	uUW5KDnUajj1kovh/+99qpZLPyYQkl+4btQG2oe94+SiJ0EsBbMzY1VI4AUpUzfVkahVFF3/Hyrc8
	3oZB/Hopntx5JPxpKG/s6SEuFIvYyLMag5HRWVrwXEbYtlp5gDQZz4cR5C+h5qlJu1GbABUyHxjBY
	pNGPRDtPW/36Dc8eQpems1XxgNbK0dMAehuGjVmcr3J3RMO6t9paccL9IDnQF66+vD77vYxzERrwz
	TTi93LDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dQm-00000008NEK-3dHB;
	Tue, 29 Apr 2025 05:22:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dQk-00000008NDa-09Ez
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 05:22:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4aj024687
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=; b=pHErKgJmHB21NXPV
	clUfGkZxB1TfUyv2XyImOoorta3DgPmcVWy+HXiiRBAGiiKAhyOcK5BKECjL1a3s
	pCkJrGXOugBITbxM9Xuu3oZpxL/dgZ1WPIar86MIN7i5XnPC4jR5uH64CP62Jmf7
	sEGYqDk4+wGtSBF+ZBu/T6hh34XFMgAmMO6HOTsyYYiiZmkblRohrux9JaB86L4O
	8hB2yNBEdDcXEIrCdu5EHuH6yfMdVnGAq10PLIg602vOBsMqLUk65E2NHUW01muO
	d0p9dD+y2d3lT4LGqiX6I9/BfOQBtxr0PI1KsxFJdopDVbMEGBJtp3eXhxhwEtd9
	1KL/fA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkgwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:22:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2255ae39f8fso61131765ad.0
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 22:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904171; x=1746508971;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHju9dv8AbgTtrh4Rh+8EaZhuXoJuvizsQH/ia8kfRM=;
        b=Yl7t7Roq+Rq3/NQI4N9M8lZOBiK+yFQ9RhSy8+6rCXDJlq0gSLE5amTK2D6mXfSZyJ
         a4hpDQGM26EC+WdLjIKHxj7ffawqQ/a0DFrI5YH5alwWTGQnlFpK71Cg0TPmHgjGmtMC
         ahjqHZQmNXdNuGX3TTT+K7XAusrXDOdzEurYcJl+c6wGjPs7eKPH6GfnB7whiWhnKodZ
         n3pgafCbxWTxEvjtBJuKfqaAEoWNcrFMMb4MQbOn9rE7moPVJq52wdUHAU+hCJwYL0zy
         gFgad7bq0jvOXYAiZ7FOmebfvhcLqM3VaK6t1hcxh0c7wXEPSdxyM7aqkOOHNU27/uSb
         5MVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBoAfkYuR+5poF4ZnA63j/kJD8QxR4odD9c5ch2SQ6RDfk6/4PCHI4fhXsq6rS9XQrZkSKrzE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1l7Ud1r+1mRAHCNQgH9vvKYt//To8z3/XvzTCiv23037c7zyv
	j9ZNkzvXqdJWhOzOYqKhPppNYFS+2kmI/+Lt0lByylK9J3nn+SSC90lrv4XCNUSGgH29ZQ36XN9
	wEa+upT8OB7is84L2B+ymYMs/7gfKAtPUQIsbSqLLGrQEa2BKVgxUO1f50PIbRyQm+P1R
X-Gm-Gg: ASbGncsA6sEBQAkLbfVW7cNC3p9jBFmLy7hjn5HEzCSFas+Ew4DgrLjQuJ/GhMZ0XyV
	ilgz8DLl8gyqIUfgQ+RavbefERTkB67iuTHplaQ5mWPwfyM/q+6287EJ+ChjkrgN+EpQsHwco1m
	XiiDyrazJDT/UvwMWTpXep/RyphSrCFW8VOPL4JnRFX+qN/1E2Hp+I8M8jzdGAyq7yVDlOvQull
	Hjzm7UIDflmsqV5eRMsw43tXBaw3AgG1d/q7TIBbebGMczhjoU06lv0abYdsUZUh+3ZIIqE9uT3
	dVnZ5vjrxbQgZsuThIqz3iOidBANQRIdOhvJOkAm28gKcVMVb1yJoA==
X-Received: by 2002:a17:903:41c4:b0:226:3392:3704 with SMTP id d9443c01a7336-22de6c0b9edmr26765105ad.12.1745904171317;
        Mon, 28 Apr 2025 22:22:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6OJEOxRPg1AT+XZjBVv4nDaNye4gjeRQF7wwUXAtlbEMTRNBoGWaUB1qClLHflV5hB5V2Q==
X-Received: by 2002:a17:903:41c4:b0:226:3392:3704 with SMTP id d9443c01a7336-22de6c0b9edmr26764925ad.12.1745904171003;
        Mon, 28 Apr 2025 22:22:51 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a28sm93665405ad.110.2025.04.28.22.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:22:50 -0700 (PDT)
Message-ID: <3dc71c4e-1061-da32-9974-b0ec004ab328@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:52:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v5 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
Content-Language: en-US
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
 <20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOSBTYWx0ZWRfX43LdSb48eXuU i4h5k+87JWZJUss9noSEXbVmc8VclwV/+Sp8KSarTxovx3Y7T5sRvuXKmsKbxf57GJJaWDPkc6R UZWZcFOX4lmXtsrSys5hncbBLZUjHrPdi4ANI6G+BAEbZelr4bbfd5PVHLoRgiJzf+nUkJZE4Ru
 8k+5uAHKFKPtgjFxCRVmgYXV37Y0odxhUk+rhjQEkkN0TmrgpoJ1Xpt9QxksjGKEdCZ8S7EgYbT VHH3IRrFIMg4qpTGlLa4ey8d5i9BNV4Kv656yRIPe0eeeFm50hcoABllfVxuW/awdhBYAk1sXA9 Qaq8+1qXVXstzgyEvm5NOHonQASygqZhzOd07xef75HIIW/+Aq+QrPNRSH0SCeHBV1Qq32Ka5qp
 cKMBBpkxKmesZkvoz5DrgoVMqelv1k5oq30141ZjkXXg57kShYftMkgRxAV2gvt3oJweg8kN
X-Proofpoint-GUID: fbh6-ak7fREH6GWMAn5H0AwElch5jf7D
X-Proofpoint-ORIG-GUID: fbh6-ak7fREH6GWMAn5H0AwElch5jf7D
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810622d cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=N-p2Yt28-VMXFBeuicUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=719
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_222254_188336_2FEF6B1D 
X-CRM114-Status: UNSURE (   7.68  )
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



On 4/9/2025 12:15 AM, Aloka Dixit wrote:
> Three out of four callers to ath12k_mac_get_tx_arvif() have
> link_conf pointer already set for other operations. Pass it
> as a parameter. Modify ath12k_control_beaconing() to set
> link_conf first.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

