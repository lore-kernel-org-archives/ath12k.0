Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3015EE7719E
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qnvIQCDqBvB0sPSazWj2d/m7pWHHbXV9UJIQdj+voA=; b=u/3g0oVK/YxsRx6QNmEEKMGA9T
	m6WxZ1pa52e7kRcaOurqOkFgruTeNbVYLNu8QGH5Sv53HMdTnpJyAoXi+FNlh7fBKej884AEN/0kA
	tXABpq5wuN8Q9/0YWbhI7MqXhXMoHphXa5CNPpHkr0qtaF5YF6eE/fTgP/koVZ3DccrlQ3EbSRu0l
	TEyEZ6lJqLeUZPs4APQTDJqomsZg8ZE5T+rLkaMZqms9LNCsUVwLJ5UYbyfbIKPvBOFNENy1Nb64r
	kwuAkP0+WLcgiaUFP+lkXUj66vmnMYikxi7jgg5IoobYdzuvu7mS+DFgeB8p9k1YqfYTVzDbJ1JS6
	jg+vUrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHng-0000000GE9U-3qNv
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 16:23:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHcx-0000000GAgq-3EeB
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 16:12:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A98XbT006310
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qnvIQCDqBvB0sPSazWj2d/m7pWHHbXV9UJIQdj+voA=; b=eEDm02kTlH0KWgR6
	D9PA+qeS/ZLM6GXZHt4iCbfunY9vC7oRQer28MXq+qilcGKAvWK39fauFh7uCz/Z
	y7CGfVVVBGJ8YP6BymsN+CEtcbyYvgOPLmE10T27dQOyFm7Du0EjyMR9xOndiHzM
	PtDO6NyzBV72Ae7j8Zgu9JSUmSi2DH/ptr9a9XqgX4yX20pBh30YXW7yzPM4P5e7
	Kw7TyfSVq/wW9krOjKDGHsKXoau/DTc0igNw8xw3O/l0X3T5+AYMH557oTR46uvX
	hizChdeDUZQRlNVYr3gDFlwyRvTAStBAB20ijv9CUtoGw2zAS5oPGrGgPruMGMgo
	lAdILg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4430nks5ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163dc0f689so56416295ad.1
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 08:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525569; x=1737130369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qnvIQCDqBvB0sPSazWj2d/m7pWHHbXV9UJIQdj+voA=;
        b=TefFz1ORDFxn8HSPyFrJ3SZ+XfvhvP8LLN/n+9aAp9OKQD03WPQNhNbJ2O6vgfdjgs
         oAGUIZxFlhifHyOc7xxKCjmbqW+TFmGHFFFLiikQBk/zgPfLIRIxugTmRrqnWp4Xq36r
         gd3t+xT09R6vlJkWKBhZH9pCjxmCtd+1Tvo+im8o+NanzKc8XPXtI+UdhST7W0t1zZmU
         I6XLQL8GG+FwVwaPD9mmgm3P5iUf+wcsT4V7xWO9BEZ40nvpoGQQN9asgc2g2hAmCsH5
         zQ8yNfrQPqjxMfzbWrSknVnyIXDUuf7Scj+628KV0UoS7yA1nUI2WTY3DK00yi4CaWJg
         oCsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqsQuWY6LRXIqErSL4ZlQsGPMTky95qTwJeNka+eTnQTOIh0eLLdWsoIfFHxf4391vFmCbFEc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRwf5p5tGT3OloS+oT4bFZzs4BepHzYvFSTXm0fAblLpFdUfy
	WYEZfALymFfcXf9bLGwWEjMfpLMNosBGBSj68hha8egLw7N7Pr3WdX7OKBvlgAI6chIHNnVWabE
	6X8h4Y1fG0gvuMprRnaDvnFfPM2PT7NZI2cTEPB2i9o5p8QqCHrnFinSmHl9T
X-Gm-Gg: ASbGncvlMMYkSGHxGiKhK9Tzxj9yYZqeJnqpBZV5p9J2UoFdTNrCaZvoQqkxznmwnT9
	YsKC/wep0J5Hrfa6Hmw1lb6fwbjA5/FcZSrIFqrJ2/ebkeKQ1l+TlAoO6LDO7YDo9XOde58zzT6
	HbIzzih4G57aK6zphkEZOUkDLW/mDdUpgeiXQnHI6Ux25IY4IfNTVHhsEyFvfmuyxHIweX/aAjQ
	18yZs4Y9FBYwPLujLZE2JNyDF8IggNO3JrvThD+sHjfyKY12XeBmFjedXLSOSQ7f0TWJdQ1yUVU
	u1Bg4eFTQEOEYzmHunRRa26o6Xirs2dZ1fJFCH2COp8l+U3LvA==
X-Received: by 2002:a05:6a21:789a:b0:1e1:bf32:7d3a with SMTP id adf61e73a8af0-1e88d0478d0mr18342414637.26.1736525569075;
        Fri, 10 Jan 2025 08:12:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvcDBOWh4yGc/eqgeGamPmGgUOzMRPOd61Q6PrOP0krIimFhejT24fBclldFbUIhuwCKSQYg==
X-Received: by 2002:a05:6a21:789a:b0:1e1:bf32:7d3a with SMTP id adf61e73a8af0-1e88d0478d0mr18342378637.26.1736525568682;
        Fri, 10 Jan 2025 08:12:48 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de807786sm3034286a12.76.2025.01.10.08.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:12:48 -0800 (PST)
Message-ID: <0862448f-8e46-42c7-b1be-175a4be7c167@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 08:12:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Fix uninitialized variable access in
 ath12k_mac_allocate() function
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
 <20241217035920.2683568-5-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241217035920.2683568-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8RKHA81rqeI53YYprOTgRDOTSjOVN4s8
X-Proofpoint-ORIG-GUID: 8RKHA81rqeI53YYprOTgRDOTSjOVN4s8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_081251_932927_47132034 
X-CRM114-Status: GOOD (  11.11  )
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
> Currently, the uninitialized variable 'ab' is accessed in the
> ath12k_mac_allocate() function. Initialize 'ab' with the first radio device
> present in the hardware abstraction handle (ah). Additionally, move the
> default setting procedure from the pdev mapping iteration to the total
> radio calculating iteration for better code readability. Perform the
> maximum radio validation check for total_radio to ensure that both num_hw
> and radio_per_hw are validated indirectly, as these variables are derived
> from total_radio. This also fixes the below Smatch static checker warning.
> 
> Smatch warning:
> ath12k_mac_allocate() error: uninitialized symbol 'ab'
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


