Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52402C0218F
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+PJHHNUM7JKRtqvYn0W2n6QUA5GasDwvRyMs9d5l8c=; b=sDPLeLLA7fIsjMsmDi0Lq5jy4A
	SKR4LgM8WhkNQ1VWy7zNgdtuXNmT1YbeFpBws6wleOsKI8Z5n5C5RmLecbYJ4+PubR+PrIFQAV69G
	91T2hl1ESS5UEeTjtEuJX9Trwo5Y/aBEbw2wcjbzHzUWiQZW1HKuYkWapuZ8LKg9Q/flIcc9pZfAV
	XRLLZfo5bl21ZkEIPmOOzR8EsbrQ1U0Kaj8g2BM+NCYS8qFJGeQO4iLLkPqOPkEY4CPnL6PYo3NXt
	HA5Cr0kHYYz02gitWYJIsQMa95frmXwDhWYbzpafTHPiqB4XsmqxwP43mIW1ogrQQR3TVlf3nC860
	ks004GAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXfO-00000009CFG-0Opc
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 16:45:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdXWs-00000009AoS-0CW2
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 16:36:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UFIdeg006681
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+PJHHNUM7JKRtqvYn0W2n6QUA5GasDwvRyMs9d5l8c=; b=YK01jGOV7O+L4QeD
	SbzN/ZzWynCoVJwaaZ27DmlxKxEkogD+NFufqmdLnOkweV5GSA4s92AhR8htDb9B
	JnV1pfU0rp0LnbWKlp7BXxGUkx0mMMu4sF1uieZwILXBhe3wp7iz8eUoumDvUdJH
	9mP1ag7lfsipeRlhIYynb8gqNXGpNsjS0lo7BBxm3Bx06eoXIOPvjKEOhy7CMeV1
	+/Fofp2Un6j1Sw+05b/5DMP1Z8sxw4dWrN4yPioXo2eGEHmIdaqMQ7j9S7ANrv3M
	VCsTTyJGNWOrvLZ/yNm0nsIlhYsjiU5YPvEeoDZXE/UXp1QGo6TWFQVRPUYE/pHm
	I+Wfhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gby286jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 16:36:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso1946649a91.3
        for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 08:36:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254991; x=1738859791;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+PJHHNUM7JKRtqvYn0W2n6QUA5GasDwvRyMs9d5l8c=;
        b=B/oN9TcSpcv+odwb2Z96GWDaRT6tTm8oxCt6njEyIbxu7zw+7H3EpIf1ZiGoE5v4hu
         i7WL4R+NtDyHaUev2yL19wgDLJ5O5CCkLDOlC4iqfYHVVX6kL9KbfZmP7lLq/10l/vew
         gRcw7i3uhV9VqkYJ5fn/IUGXD1cU5luTwW4CaEkTg1AbFFsxumDA7et+nIqjBLtKtmAK
         1vyzBRkdsFskC16ALinqWiGbvSKWctPZjpPtDX5FvhhivjiwdLcN/EmTjIdCKygXtYub
         ugyEPn/4+Q05RC9qntv9YXZuyWtNqfOBELsX8mYXsOvkiGSwIuyvF5AgAHoaNcY10XNA
         fL+g==
X-Forwarded-Encrypted: i=1; AJvYcCV/ArZpZmOcxLy6JqSue9tAhPUUBTmk/JCxeWhGWKG5qUBsXW6t5ivQK8oq5hadtEE8B+TqOR0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbViNIZqgpUuMmXlXeRT7RpQsl7Gzkwmr4ZrIGanCjsjBs5pQO
	rirrMlh8EjpWdKVwHsAlEW241iTsjwzGDwnX9/Sg032s7niEzFIg0pYGoWe4yiCebEEUWR06zgl
	dyxHSGyuvIPOdSkxfxGEedCRnImhB44ZzkNzXL6OJZyNrBHzQB/8coeuFk5d7QXtBwhmL
X-Gm-Gg: ASbGncv6G1euqUI3QjcVQQK1jRT+LjFA7CCSE3aEgx0VpfwrPII6TB6fuVksnx0xgLV
	cbYP2LDUFIwYDiNAiNeGDufoY9bYe+jldS7Q7I9yuoNXRZRC+VJ30W0h+Y6OKs4ueMJQmYSW3Ta
	nPlrEPp9rey6XMNQz0HCjrjvQ2/WPnTzK9hwzDagxv+FhxX8bpQq9vGqCtctQADPQFX6WuU+uX7
	gOeQfN+NThy9GygowAgCTbL6VlD/9PaCEWKJrbw9vUr6iOKR8fQWOw3V1Df2Jdc4Y47QPl6wdgT
	/OsfsPkc9S3F9VDvlqXpBXd/uGWtCS+K9QAju3b4z8vDue8HRy4qGfbQrTZIZVO/v3C+chUSnw=
	=
X-Received: by 2002:a05:6a00:2c88:b0:725:ea30:ab15 with SMTP id d2e1a72fcca58-72fd0bc25a9mr10087334b3a.1.1738254991557;
        Thu, 30 Jan 2025 08:36:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLHEHWPHz5nU11q7K8i4TTsLhAkJXiHYkIBZpCH9/QispHX5zVscF3iDnfEjO6RtQwhjKsqA==
X-Received: by 2002:a05:6a00:2c88:b0:725:ea30:ab15 with SMTP id d2e1a72fcca58-72fd0bc25a9mr10087309b3a.1.1738254991188;
        Thu, 30 Jan 2025 08:36:31 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm1653651b3a.7.2025.01.30.08.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:36:30 -0800 (PST)
Message-ID: <17deba42-f7e8-4582-87e9-e51a0f3c2bb4@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 08:36:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Add new features to ACPI
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113074810.29729-1-quic_lingbok@quicinc.com>
 <4dadf825-0b9b-4109-a8a4-9eecc9f1dd5c@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4dadf825-0b9b-4109-a8a4-9eecc9f1dd5c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BuZPfX3kE93Z7LW_bd97CY9-r1PUP2rH
X-Proofpoint-ORIG-GUID: BuZPfX3kE93Z7LW_bd97CY9-r1PUP2rH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_07,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501300126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_083634_213147_77CEA19D 
X-CRM114-Status: GOOD (  12.53  )
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

On 1/13/2025 1:06 AM, Aditya Kumar Singh wrote:
> On 1/13/25 13:18, Lingbo Kong wrote:
>> By reading ACPI tables, implement a method to obtain the ACPI functions
>> Bitmap, enable or disable specific features based on ACPI Bitflags and
>> download board data files based on ACPI board data filename extensions.
>>
>> v4:
>> 1.rebase to 0c5fcd9069dd
>>
>> v3:
>> 1.change some function name.
>>
>> v2:
>> 1.support functions for cases where CONFIG_ACPI is disabled
>>
>> Lingbo Kong (4):
>>    wifi: ath12k: Add support for obtaining the buffer type ACPI function
>>      bitmap
>>    wifi: ath12k: Add Support for enabling or disabling specific features
>>      based on ACPI bitflag
>>    wifi: ath12k: Adjust the timing to access ACPI table
>>    wifi: ath12k: Add support for reading variant from ACPI to download
>>      board data file
>>
>>   drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
>>   drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
>>   drivers/net/wireless/ath/ath12k/core.c |   8 +-
>>   drivers/net/wireless/ath/ath12k/core.h |   7 +
>>   drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
>>   drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
>>   6 files changed, 217 insertions(+), 48 deletions(-)
>>
> 
> * drivers/net/wireless/ath/ath12k/acpi.c: 2025 copyright missing
> * drivers/net/wireless/ath/ath12k/acpi.h: 2025 copyright missing
> * drivers/net/wireless/ath/ath12k/core.c: 2025 copyright missing
> * drivers/net/wireless/ath/ath12k/core.h: 2025 copyright missing
> * drivers/net/wireless/ath/ath12k/mac.c: 2025 copyright missing
> * drivers/net/wireless/ath/ath12k/qmi.c: 2025 copyright missing
> 
> No need to respin just because of this.

Some of these were already updated by other commits, adjusted the following in 'pending':

* drivers/net/wireless/ath/ath12k/acpi.c
* drivers/net/wireless/ath/ath12k/acpi.h
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=caf84aa5266eae44823b736c5c77a39b92d26199

* drivers/net/wireless/ath/ath12k/qmi.c
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=856d8cd0fe08679af8cb3b9ac98848b1a79ec4b2









