Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD069C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGHcxbwT/9I+U/jB4ylFh35biB4VoYk5uup5pUh3fjA=; b=Iq6q6Y/vXa7t30ng/V7rXlP0o4
	LQm8bdsJXAFZch8OWs6gDfyjfp3kjWupxfH6CMtfL7drXSQNMi2gU/zlW8fglV35fcmdNglYvDB9u
	FesnnxGeslcPjQJ8a8Y22xLLCeFeEVdr9e0ARYhF+uF8x+GPxq2E8N03/9wZlJUPnMlhna4za/RI9
	yeRrbD1TLHI/9bBBi7kUnRXnsqlaCz3xh44loSwkgPK4tmZmmlZk90mXCNUVCUdHkAoFEN6SG2aq9
	QSXoTTxogP7N34ZU0vcSJPrXGajnuI/WrfY/hS71LsoqaiqrV4s+ow1C1ynQ6snBndMLKTVy6vSJz
	8/P4/qPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6S5-0000000DlaU-2OtH;
	Fri, 11 Jul 2025 05:37:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua69I-0000000Djp9-32WY
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 05:18:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X3DD012039
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGHcxbwT/9I+U/jB4ylFh35biB4VoYk5uup5pUh3fjA=; b=JNpyjg+Oa0LltzKv
	VAvja8aU+XaeEndqVCypMSttgjzWNkEDaDODVFzOVUdWbLuYKQlzP3Tg/wqPXMI/
	41WivN0dsXAG6UOcsftIvmpOBoky1puxXdKBEHBxULBVIG4hfe7RLS2YsBBiVQ8w
	l5GmOJyynY1rHulnehfHrQiI5ExSnMaSiP51qtBhOMVNKLQZFwCMZ495EQVro+tZ
	9Ua04UcpdTGCD6WenbsygWrqklvP1xxDsmtuBgKgJ9O188xgjFMHOB+jUD+pljOZ
	F6l9ebt0oCxY2rBU8TNZ4soTt0Pn0Ye6g9pfi1TnVUzNSEEd8RG9I6y6AC7S3E3f
	vnlJow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dyatx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:18:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so17078175ad.2
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 22:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752211094; x=1752815894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGHcxbwT/9I+U/jB4ylFh35biB4VoYk5uup5pUh3fjA=;
        b=AO8x1ebKQBcZp7wi86JpbofDy5yXRRzSnQ9vsdjLoIz3jgE1/rVDvWQDvSghVJJLO9
         3kyiu50W1w7n9+/8pEHzMVqR3wzz+WZFBwYQnmHXNtznXj10PTYvs0LnxCRFMzxZ4N5m
         NjIafxnwV/n/kzzdz+hIqPKzaYkVyH1kuDJoxdiHPfl65TuTTqTLo0sMOIL+c8M7JK3U
         /DQ/LvwI57Twmkcw5VW9zdNNBsEcw1bepp+Nxe8r9T/n1Co79rEOJmQ2w6pi6y802cha
         CL2rpQhBEDjdZKqqfMUpVt1CUp7MzhdkrM9IFYnvPTicJcoXfvJDDu2yU2WOkYIcVaSv
         SQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVViwKE7SbghwfaJWDzWRupJ3ReJ6ARWWvpEB6PaYr4dQ1rIubBLIDzrXsYRA4FfHMOMJ9O/No=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLLpk3SUN1b53RprNi1aIG3v2/9XqJ1eqzZ0jSaQVzg4vuuIQ8
	hmx1xUzTLNcBjKUuTHG9TUORapKePqCCnBvKrjc6kd6Y/O957hUfVXCddY443jAghUewBln+p3T
	dUkWn/vur8/EhiBqcgKb1prZLD3rHjHb1Di5h6OAbv6jKyLlyEO2bl6pxPsV1VKQp
X-Gm-Gg: ASbGnctECrMUzsRdLu/m9yB7qu25z0MjP2kx5u50QUTmT3ft6cKdXL25d9c7sYoG/HQ
	qs1G4VdQ3BEWtNArFQLE8d05mNdeimoETs72/aIziO2CfLqEEK+QADGPf7V7WunlvG8ytzC9w7z
	VQXa/oU38wefWv2D6lsSXUfOAKu7cNXdY5zIXbaTdXB1g3FqyjWr/ff8bRUQ+WIRPCHzW30muAK
	jWatzQ4+hE+7DUx/hQ6CKrrD1uHQY+CYAovOHMq+EcqMgCn/e9q/skuTGErEKRTZ8qHtVXf45EB
	0uoQyXJ19f9HZJaSoHMsMxUjM3P9MhK8lG2PgehEYXs33oM0zdBZ8fAf1wa6r0QHWYvgD7h1NNU
	AKSZ7VjxVHV8=
X-Received: by 2002:a17:902:d58c:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23dee1e84c4mr22439945ad.18.1752211093798;
        Thu, 10 Jul 2025 22:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNM1UCCN6V5HaVT3VWAkl0FVjpS09lDHurvmnwOG9vjCFN9loWh1c9GnjU16BqrmEgVdM8DA==
X-Received: by 2002:a17:902:d58c:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23dee1e84c4mr22439745ad.18.1752211093338;
        Thu, 10 Jul 2025 22:18:13 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.235.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b17sm40608995ad.103.2025.07.10.22.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 22:18:13 -0700 (PDT)
Message-ID: <802c5ac0-0d63-a165-86ca-d7f449fbc787@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 10:48:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3] wifi: ath12k: support average ack rssi in
 station dump
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sivashankari Madhavan <quic_sivamadh@quicinc.com>
References: <20250709133554.622463-1-quic_ssreeela@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250709133554.622463-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TuP7SQv0u5NJSHohqUsKHIMsKr8OdWmV
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=68709e97 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qj7j/dCbgmX8y5u3oU6Y8g==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=B8JhYHFz760a8drxLFIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TuP7SQv0u5NJSHohqUsKHIMsKr8OdWmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzNCBTYWx0ZWRfXwFi630dWnhnJ
 Ui0Z3lvN85TOThYCJSJjDh7K1c0ILH9ulCNJcGkcU91nUZb4c37UD2qjAaK8Bz+I9+GQyk0rVLL
 CSk+pXrn9fWIqaPNHiIblAoIXI94nQ13Yq9A9H2TXuhn9EWBZHjd6Th8/glC2AonnfBRP2yKep7
 kuIwfi9v1ZcbmNaS4C2LDLqClBXyCwtvQyCM+QTh319kUs64BWLqpP6tCwd9nD0fjrnJIRAlQEk
 KkwxDp4OQ4tqkVVyxNWBC4KNZlzwFdOEqDznmeCfFwXLHZEok5aabX6E0ZHYWymCx8M1XTb21We
 Z2XgETnNB2te6NLKqgLjkZLMYuSg9MZ8gW+EN5OdERyrvHYx7caiaNagPLbq/qR8/U0RlQg8eGo
 rTXBRi2V7fwUCgCeY0Yv9vY18vkc3so4Nie97VzewjSQ7rVp7lTSbPwnx9Wj/vOoNCg9FrSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=898 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_221816_885032_E13536D8 
X-CRM114-Status: UNSURE (   9.38  )
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



On 7/9/2025 7:05 PM, Sowmiya Sree Elavalagan wrote:
> From: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> 
> Currently, the ACK RSSI value is not shown in station dump. Enable WMI
> resource flag for ACK RSSI in WMI INIT command to add ACK RSSI value in
> management TX completion event from WMI. Update ACK RSSI value obtained
> in management and data frame completion path to ieee80211_tx_info. Also
> advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag during hardware
> register to mac80211 layer so that ACK RSSI is added to station dump
> message.
> 
> Example output :
> Station 00:03:7f:01:5c:4b (on wlp88s0)
>          inactive time:  46584 ms
>          rx bytes:       955
>          rx packets:     10
>          tx bytes:       769
>          tx packets:     6
>          tx retries:     81
>          tx failed:      0
>          rx drop misc:   0
>          signal:         -39 dBm
>          signal avg:     -40 dBm
>          tx bitrate:     6.0 MBit/s
>          tx duration:    1185 us
>          rx bitrate:     309.7 MBit/s 40MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
>          rx duration:    0 us
>          last ack signal:-41 dBm
>          avg ack signal: -40 dBm
>          authorized:     yes
>          authenticated:  yes
>          .......
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sivashankari Madhavan <quic_sivamadh@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

