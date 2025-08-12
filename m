Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BABC87FCB
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 06:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X7uUXq+zJMT+hUeogVDygthzbLkkY0vCz42E7ikQoc=; b=gjF7ehdnV/oLTxFa7wHGYXtQKs
	ZJmIzV9OSNR47z4V+r3I9gse4Xv4VgvamTPrgeRL4ZSnicnTwuNaz8pJ2jwX7oO0RFALBShZKy5yN
	b+J52y+olQuEFcdjUxE9x+JByGBcpqHlfsumu/KnvOuWiuTYASbCIQL/LG5QZ/s05cTm/yA0LZqHR
	GZK6mZnkK10Uot+WZeDaCY4LtiMjCaGADCDkzYwV7uhAxsYS9VOog1Om2etZbgmBEyn99GZnGeS6o
	0QZPcM+CMle/RP78SzWtEybnHRPX6DlwogKIqlA2Q0GjHUf+1PZ0G4k/sV0HaIdEXtlegp0WYMB+E
	uCL5FEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulipm-0000000A4Di-1XR9;
	Tue, 12 Aug 2025 06:50:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulinj-0000000A44L-3JGy
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 06:48:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C477PP019168
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 06:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1X7uUXq+zJMT+hUeogVDygthzbLkkY0vCz42E7ikQoc=; b=krhvnjPG/RU93tKD
	03J7hpsgFH5/gZUAXsYAs0B7vBKKLXIwGtqqoXAYksihcBb7RV6wvgQDpFwaS56f
	ij2nj6PvEDbjIvMFuPUYNCSzQIB3sAc+/gxxpvpgGEXvjhje81EGgix0xHN37rXf
	u4b8v0/WHaR7BOoz0LLDwQ1fcvK0OP7XlMLvwnE1iu9hTgvvnrMXQK+NLETRjKsM
	kMk/Bl3kppuRiVi77eOKnza2WE8ponCB/EmLgYBEb/LjpwvSnwS3Nv/+U8Jr6Uy+
	y/F5dqB4ISxNvZOTu6my6VD4ibgq9ybkniJe33UOpzdLfzBH2WfcNmyG5qYK5Ibz
	IMDV/A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduy3j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 06:48:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76be6f0bbfdso6834897b3a.2
        for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 23:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754981282; x=1755586082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1X7uUXq+zJMT+hUeogVDygthzbLkkY0vCz42E7ikQoc=;
        b=wT98UFpyA8EA5QV0YjpnRZiB/cuYJPo0w8Fmo/EsMIyCCHXkzGvYHnwHST7FwreAnQ
         Z8z4ck9N8BI3OR+f2/QhXZvA37Vq74caij3qoqslMPIGfZ66IMdx+ZGshUFQlrItd7fS
         XhK5R0sYJicX29DgLvcpyx20XrYNQu6qAbbTbk85TNcXtabN5TRyyynUEphmHr6S5Hbf
         9WXdqUPtyCA5ph29fT/EyvggVNX/NUPJn0sBf9PKFoApfJRwngR/9YfmdDwfDi+cpWPg
         49sELviJJZlidbyjYVX593omzTiPFCNDuA5E5N9WTNqwgSlErkbVL1qBlLhU85/Sb89s
         yeuw==
X-Forwarded-Encrypted: i=1; AJvYcCUThovNHJTZI/mzy7FgjvZmmRjI+VPZa+21P40AQfjSGI6xvICdaL6ZPAEVNo2CKA74IKYv2pc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVkhDmjtoY7bx7gtlU31xIA5ZfkpyO3oHo7/uxQQIW50tBJHGI
	53S1U+YOjXJgSUojt9ihxwYpCToJNajY864nXqtfV2T19QDggfHURlD0ZPrgm1SaSBKb05edc+B
	QSNYlytCD6OXlQbEwJIfBDzD5DtXuwZFv+WRfGyNVh/mq13WLOshrm8cTe/Lk5Pre
X-Gm-Gg: ASbGncvdtFhRo/awcCU1yRGpLMkTpfj+V2ODHNULscP07ekoVT0ZOlPYL2gqSlRTq95
	ErbIqmg3WY5L6QtNzJEHxfnBaDqlizo2IwL6HkmPJjrjkcQ1m/B9iiOmSuUpCZ1ZXeV+RXwlZxA
	qXN9iqaG78zgUzdFQd+fvki3OpefukjSO5+1/USSG4fvAmeNfuSg5PBkl1MYy2Hct9c5OhF+LBn
	+wwb9TMsgmeF8IA+fEZbE803shkrGRSruYy2t2c24HDYOR7KqnrB9j9YBem/Kn+AGWIcG47SHIQ
	fVRV8k4D1YtyyhuJhsw0xqJDK3ytDT4BtGDOU9/Pb2JDvP8e1wWMrLTkicOqmSRZXeYyU/+ZoAB
	9c9Uw/A==
X-Received: by 2002:a05:6a00:cd5:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c461a971bmr18576424b3a.23.1754981281728;
        Mon, 11 Aug 2025 23:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7H9Ql2feGPxhbQjAq2JDbE+sn/xtaVTj7G2n2qgBV+ACS1PNMwVZHn3m/nICxCW2NXbp3lg==
X-Received: by 2002:a05:6a00:cd5:b0:76b:2c12:334c with SMTP id d2e1a72fcca58-76c461a971bmr18576394b3a.23.1754981281334;
        Mon, 11 Aug 2025 23:48:01 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd6aacad9sm27578448b3a.124.2025.08.11.23.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:48:01 -0700 (PDT)
Message-ID: <cd74ca34-4303-b884-34cf-b5930359e327@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:17:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-current] wifi: ath12k: Set EMLSR support flag in MLO
 flags for EML-capable stations
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
References: <20250801104920.3326352-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250801104920.3326352-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689ae3a3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8hMa9neySeqPw90dFaEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: mIKd9Sqclc9YSeS7kQ__71G5JWwIlC5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5QABNyKYgZJE
 jxd2Ay2TgLdKBR+Bxa2Lpaa32LCahqQF81QFuF7qeKtYUGzDvBSTYFBf30VoarQqudxs6h6O+r1
 POx/bLg8jb6DQGXfbsrLaWjxz+2iWkyxzYxVSVo3aXL7p0hJ9Iimu2vZp6ZGLhsWNB2w8lp6NId
 v/414eZ7/xkqLn8Av6CYALEiKbLsu5mnAdZNH/jhplNVN836eOrlJ04JNSeuPhYOXRi3FhAyiOW
 ereduniv+HOUeEKtGQmwVU0pH7bi9F4Y+knaHihMAUbMT7EWk8Umlep9wVHT/7S4dWCe7OmjWzM
 bDGSzn+ZMuXCAlFp0+wbrjbYw5SG//tr+1oLUZkqBczv2JBgGp3gLSKa8AGu57Ma9rurhntBRPp
 9vRVzD0g
X-Proofpoint-GUID: mIKd9Sqclc9YSeS7kQ__71G5JWwIlC5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_234804_025357_322A1279 
X-CRM114-Status: UNSURE (   9.61  )
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



On 8/1/2025 4:19 PM, Rameshkumar Sundaram wrote:
> From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> 
> Currently, when updating EMLSR capabilities of a multi-link (ML) station,
> only the EMLSR parameters (e.g., padding delay, transition delay, and
> timeout) are sent to firmware. However, firmware also requires the
> EMLSR support flag to be set in the MLO flags of the peer assoc WMI
> command to properly handle EML operating mode notification frames.
> 
> Set the ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT flag in the peer assoc WMI
> command when the ML station is EMLSR-capable, so that the firmware can
> respond to EHT EML action frames from associated stations.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 4bcf9525bc49 ("wifi: ath12k: update EMLSR capabilities of ML Station")
> Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

