Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F7C28B2F
	for <ath12k@archiver.kernel.org>; Tue, 11 Mar 2025 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=; b=u7bIWhYW1/SrY/T2MpZ+I4RmCE
	ga5FrpNj39O/W5s7eNF+JyKWdj7t0i3Cuol1FOab37rYUVdcuBdnLpCvm9EakNqjuCTREfm5k19FI
	QG+ISp2gPnj83Jln/XG0bPxVZmbVsVdXTd+3LYbhwH2LzNDwVe3ZdFEGTMQDtqFilNJF1gbFPjN0I
	zg8ccLdS9tiIe7SGPUU0aKZYDIgxB85kL3e6HLx6J7NE55jCedyNi3xTW1wL0PfB3PS8VnerxMcjV
	3o6/KKU4j21ufA4BFSaETfxvx/0IZnWJXm/kIalsHVhvWZ+N/Do5o+ml8GZYloKPLCGWf/difX9Mq
	AFBEzOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2jl-00000006MOy-3wEq
	for ath12k@archiver.kernel.org;
	Tue, 11 Mar 2025 16:45:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2jk-00000006MO8-1Cpu
	for ath12k@lists.infradead.org;
	Tue, 11 Mar 2025 16:45:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFtgAK021474
	for <ath12k@lists.infradead.org>; Tue, 11 Mar 2025 16:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=; b=bVQC1W7L4W2f0gSL
	aBtfFDQZkgmUZixkrLCUAPewEC6g+czVQa61PJcxLEZqyjsN5UyDFhjzhug4CXeH
	aF2ald9nulF7RMcuSOQh7x2tanoS7iUkFSLZROgVxf3Ea427slDd8p5vQckUoRpr
	n+Yc0CmvmV1JbDCsSrhnv9eh9zZeuQlpeNuoHFbZ0vjXEpb6o3BI6C8763VtnOLu
	boppqcKVoDPq2xfxCjVTas1RBi9Ppa8REsjHMPyEEUIdURjsY+tHsPDCWOeYg6Zi
	Zj2WLrj74Y05/JxJIxTAoIjxkgCQinE6Y3pW1h8CihG+CpYKVsrUTaREXvNuZR9E
	qyfsjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0w98s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Mar 2025 16:45:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223f63b450eso87520545ad.2
        for <ath12k@lists.infradead.org>; Tue, 11 Mar 2025 09:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741711546; x=1742316346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=;
        b=UYkHdW2n8o78o4ZJLVkzpx4iISnHBXaPxWygnbZF423r6kWqkPDKvI6n5evD9mpGIE
         fffvRbWxjT67bQ+4A6zlzO2itHb4vl2aAtQeRb3rrqfFN0ZCk68VzHxojdMlDudVg/I6
         m8anZ8KoJlHaVcl41QsHPcbI3pfxsc7i8GgCtWfdwU2v6Y1q6ob0clUWekaolcJnhEm9
         GqEZ2z/f1ZuUkG1iZqkrbhAnDHQVgy19EDxWzLbr4eZijTCNgz/maG+so77tX3Z7cjUi
         JdmMdGPwIxEE2StNh3wCNkG6p+Fj51oSZve5HPuGWJecMzar5NTwh0SBRoX3Y8H1XN6b
         3crw==
X-Forwarded-Encrypted: i=1; AJvYcCVANB/6USIMICLcK7JDEaTmQxqpjWkiXK95q+N0j530l1m8phXl7es5Zlx2xIr4VX0xeZ/+4Bg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqGB1wgCxOj03w0w4XH+hKNvLe4t8rO3b2a4z8Z7XBAEuHzIPh
	FYURfBhQfE+WAxcDGpRCOgbfqQWCvrFK4Q1AVeGpbD+YsqVxugCMqWaalytLkEU+/BOs3Ae/H4Y
	T1OnYmJcGfLdrW59QdBgKPNh4UlVfOx0s0iLSiFktlSjAIr5FSYm0CFzi0+U7
X-Gm-Gg: ASbGncuFJGPyDWzXUAUginYeYcrv/lmVuqzmX4Ari2IUZzp7b0apHAl8FczEJl6+V7m
	4kVT97ZRLYiqfpfTPUuhPneKZs2TjxacKMsUJuaCvZ7N5Mh/lqclQBGNEhIHjFRoSz6sOZymnj+
	MhQwZiuRl9DTeJx4FlQWvk3EKQkiyLaKdTU2pHNmAmYBfHR5VbCmr2/f8c1OVKt3geYaAY01C9B
	AMtUrF03wFpmV/S1jwsvaotor4oa1Xanq8dsTbY12+5K/RsstsB/q5APZ/cfAG82gWJ0ry93itc
	ivqx2uWl65oLA4Q1oZm4ZceN84TtBbjBRv+220kPF5hCWByV0JykgC5NI8A2Zg45Hd3pa/osH0k
	MUoYF
X-Received: by 2002:a17:902:f70c:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22593183d83mr62245325ad.35.1741711546432;
        Tue, 11 Mar 2025 09:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMKT0bhq9gObWNi1A7qYtgXk99hHQyFPCQuZU4Ev+zmdxvZYZAV0O9EZcj15+XH7XREyEbxQ==
X-Received: by 2002:a17:902:f70c:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22593183d83mr62245035ad.35.1741711546091;
        Tue, 11 Mar 2025 09:45:46 -0700 (PDT)
Received: from [192.168.69.142] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91c50sm100408765ad.185.2025.03.11.09.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 09:45:45 -0700 (PDT)
Message-ID: <8da45052-def5-40fd-9701-7599e8fd5bda@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 09:45:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
 <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
 <b9ccf604-800e-4e4e-bf35-62d97cd1d90a@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <b9ccf604-800e-4e4e-bf35-62d97cd1d90a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aVHMtwtuuUyebpQZpnho8o-u_Kgs9WkV
X-Proofpoint-GUID: aVHMtwtuuUyebpQZpnho8o-u_Kgs9WkV
X-Authority-Analysis: v=2.4 cv=MICamNZl c=1 sm=1 tr=0 ts=67d068bb cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=UlYobBNIKLIdKoAhXwLdVw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=92TBJxoUzZZWgJSFfrcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_094548_337947_19C03716 
X-CRM114-Status: GOOD (  13.47  )
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

On 3/10/2025 4:18 PM, Jeff Johnson wrote:
> On 3/10/2025 1:06 PM, Aloka Dixit wrote:
>> On 3/10/2025 1:02 PM, Aloka Dixit wrote:
>>> Three out of four callers to ath12k_mac_get_tx_arvif() have
>>> link_conf pointer already set for other operations. Pass it
>>> as a parameter. Modify ath12k_control_beaconing() to set
>>> link_conf first.
>>>
>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> ---
>>>    drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
>>>    1 file changed, 17 insertions(+), 14 deletions(-)
>>>
>>
>> Forgot to add tested on tag:
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Will send the driver changes again with the tag if required once
>> nl80211/mac80211 review completes.
> 
> If Johannes accepts the first two patches I can add this to the ath12k patch.
> 
> Note, however, that you forgot the wireless-next subject prefix tag ;)
> 
> /jeff


Yeah, I see a nice table with warnings now,
will take care of it once the technical review is done :-)

