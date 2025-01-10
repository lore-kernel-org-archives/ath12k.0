Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C3BE7719D
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iYWaWujGsKCPY8a2vLX77zbn5xn/LLvdTqPJX4SkPo=; b=Bf7xctFj7U7AsnSkxI2Gs6ruof
	AmP+WVRQM0oCzXygd2YaoL08FDi/6y1sZ6jpLlmdZc4I6sN04kpoO2EAfwUecafcepbCCjmqyZgP3
	GrbqzPXcq3eYUeNE8TO0CXaE9xogHTUHoUldybOq/PdMIYJ9C/962BZrI9E49X+vpssTx4YrPLVr0
	bgmOxSjuXJ/97ITURsx1zdssRhljKqGocZGK3QfjGE8JGVO8wxGOUWIqR/jJrQJLvC6rQ6YJF4aZU
	7hPCQCek7YqMJwu9sWcjD6d4o78JwTYeUtvUQjNacudNE+rWJ787htPlKtPREYEJ3C6l9CH9Oq++b
	MG1y5lEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHng-0000000GE9J-1kwk
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 16:23:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHcu-0000000GAgI-2DUE
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 16:12:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE6oqo020369
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iYWaWujGsKCPY8a2vLX77zbn5xn/LLvdTqPJX4SkPo=; b=do5YoJG0ClrGAI9L
	AvS7yxyPzZV7Uv3tYPPsU1iJqTcOFrHKglqmxFyRtiTK1Z4LlCwAhO5O1Ql+GQXL
	CvP1/aeFw/EN78mIrsUiUM5OY+rSH3GeanMAghK4XtdTaj9FoMHsLzFbH82ewYkq
	++Di64P0qQAmYiZzFYYX4B9khgINDEDFngRfUjtQ/NT4O73xXwpn04oCwT1vGS0M
	mR2X7wehZvlq8VsvtbE49tWRFAQTf3koK/fSN9TE24K5Yn1pc03MTZmwS4U0CPEJ
	7b2cLZmMjvBZyB/1UetvLvZdz8crb1CdwWrLj0tJQ/k3p4CdQ3TUpvKFOI5PCtr+
	Ix2Org==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44351a8bj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216387ddda8so44068525ad.3
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 08:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525567; x=1737130367;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iYWaWujGsKCPY8a2vLX77zbn5xn/LLvdTqPJX4SkPo=;
        b=TOTATWwK4SXAJatyWAfniHjuQpKBq6ZmFpHZ/0QBtQVxDBjNaThqf379yydFiu1Ar5
         TrPhaYce5toOxQcOf5X7yOI2Fxm8g+JnqgQjPlj6Ujv9EqahcKw1UV2h7spzC9hr4jko
         49uMEfZgLG5eWRLTg7uX3hOe+WILIzhLOM6Hy6nuqkIcQDvc4I+5X2FhD+S9plQEF/pr
         olebkr521wr1KcZwPuV+FMSLnzmbkYLUX+OXUmw/xevAKmIPDD7EXChA2j9HqVJdyr8n
         7Ou7LE1mADE7BayXDqfwPHXNiWNxBg1ql1yut5j42rV3CMgn72Y3AgoRXUM7rE2OnetC
         9jTA==
X-Forwarded-Encrypted: i=1; AJvYcCUK/uXTBpBUtxapvXryQLq5Tm2rSQczNWcVPunJYZ17VaGW7+uM7iLwVf5XIn6wGaxh4Xq1s0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5QTNeUjWgTQ9M3HI7UBiyJkaYkn3whNXi9Hwj72dPebdvFoQ
	iWUwsyT6zSQBnc8sZp0VqB81JpecQddPyuI+G1HplnGVCfaADKjtESqwc454QvxGdm4x9DtsRV9
	l8I5JEg38qCQCY6/nhforejl1OS/Sza304R6JKBFtFtY9wy0XQirzjyrbYhRvWMj1cUX/
X-Gm-Gg: ASbGnctS3qNDA4CxO/HUol1b4Y5EF3xh/EOt4TGS4+FAGF/ht/M7fLwd5779EwYevfT
	rkApuEkz8uQ63h3RGmga08O7gsmK3tQPw0KRGkmPLTBAIAZyjkzRFF9kAQaBktX++iL/HPercZt
	M0KKxTX2Ol+spLEqodYy5qLmYaClYc/ZQqgtIkT8MM8VmreJApLNQhMF+C12P4QnV1rBsCKFIvc
	3pfcfKWqnzSeHuFJAc+flswnBGDqI2f32ymwnQiMDVOD7Lk2yC1Bw3EiWNrIIbQDbIBJ4eovvbI
	EyQj50Qq3BUf69kUc4iAhrn9dYfOPgrJDcdIXE4Eq0R9762dPg==
X-Received: by 2002:a05:6a20:7fa5:b0:1e1:b014:aec9 with SMTP id adf61e73a8af0-1e88d2d4fe3mr18405308637.29.1736525566889;
        Fri, 10 Jan 2025 08:12:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSrjtUpxaxRefWDDN05bK5NgjTJ0bWRhlmpfeMG3efgDXx7X4xzN+YPAEVZbPmNF8ssj+i3A==
X-Received: by 2002:a05:6a20:7fa5:b0:1e1:b014:aec9 with SMTP id adf61e73a8af0-1e88d2d4fe3mr18405277637.29.1736525566460;
        Fri, 10 Jan 2025 08:12:46 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de807786sm3034286a12.76.2025.01.10.08.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:12:46 -0800 (PST)
Message-ID: <8c756343-af71-4e8e-ae9f-6681159e90e9@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 08:12:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath12k: Refactor ath12k_get_num_hw() helper
 function argument
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
 <20241217035920.2683568-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241217035920.2683568-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QPUsdfJUljBEbNlKO0fxd9f3sj4nH6hL
X-Proofpoint-GUID: QPUsdfJUljBEbNlKO0fxd9f3sj4nH6hL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_081248_574710_A300251D 
X-CRM114-Status: GOOD (  18.35  )
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

On 12/16/2024 7:59 PM, Karthikeyan Periyasamy wrote:
> Currently, the ath12k_get_num_hw() helper function takes the device handle
> as an argument. Here, the number of hardware is retrieved from the group
> handle. Demanding the device handle from the caller is unnecessary since
> in some cases the group handle is already available. Therefore, change this
> helper function argument from the device handle to the group handle. This
> also fixes the below Smatch static checker warning.
> 
> Smatch warning:
> ath12k_mac_destroy() error: we previously assumed 'ab' could be null
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
> Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---

...

> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index 6b31e053d6da..f37a50f3eabb 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -1209,9 +1209,9 @@ static inline void ath12k_ag_set_ah(struct ath12k_hw_group *ag, int idx,
>  	ag->ah[idx] = ah;
>  }
>  
> -static inline int ath12k_get_num_hw(struct ath12k_base *ab)
> +static inline int ath12k_get_num_hw(struct ath12k_hw_group *ag)
>  {
> -	return ab->ag->num_hw;
> +	return ag->num_hw;

since there is no longer multiple indirection perhaps we should just get rid
of this and directly use ag->num_hw at all call sites, especially given that
there are already places that do this:

drivers/net/wireless/ath/ath12k/core.c: for (i = 0; i < ag->num_hw; i++) {
drivers/net/wireless/ath/ath12k/mac.c:  for (i = 0; i < ag->num_hw; i++) {
drivers/net/wireless/ath/ath12k/mac.c:  for (i = 0; i < ag->num_hw; i++) {

/jeff

