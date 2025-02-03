Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377E3C02196
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbOpfV4DVLO95imPLnFbxGA0p3PpVX2ZR/gqOgfzH+g=; b=0AwXyTylMX+WCfP1qiwCfvFVkJ
	JqjjK7InMkSgxGRqW1ToSfBCPoT1kXTLeKsQUY4FeSu2TUWz9z3x4PVhFpElhQRJBuvWlbk5KgXuy
	48A7RrCkFzup0FN38kiZxCkk0I7D615XKle5EpIAAQqzDAqezoB3Yy6ZADQww2T3nt2wjBKzMKDno
	sfRhaYmAqDEjDhfILXBctsDuLFg5q4BeYP4FTdYDVJrwWelY7OawFDpHVUCPUtfY4oMX1NNYcCDvi
	RCmYQl7/v5QNlDgoO+A7XWaAWOcUqgi+qL0/BNFJQwXcOjf2204XRjVMw0wx/eb//a4ZjXbZxL3A6
	DPc8rDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyCD-0000000FqCq-47rx
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 15:17:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyB6-0000000Fq2R-3MO8
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 15:16:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513F2eOO032089
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbOpfV4DVLO95imPLnFbxGA0p3PpVX2ZR/gqOgfzH+g=; b=jI03SrBIEZSG1FQx
	FgO+tWTr2FLokgeV/B2jwC1kX6+8vi4UM6Hb+0y5YROeqs4UxtJ7gy/S4FdL7j86
	U1VOH+roJrLyA6TJBjgbnSPJiMl6WCuoToARAe8WqbNNHsO8sfd5EgeDz/ZMPY8z
	KQbh9RpLqNVYcNXLBC7mcQxZUVcVUFyopUYijAjkw0gIzNI5Kd9YZgBU84e+qDsx
	lLIoeI3K+6ikn/r8U4aOUgCxBhHudDGnHJv26N2VnL+mJP4iV7DF2OXNiCPy3U7e
	Za4BbxfkULLorbVspwa+KRBbTonIBPqM1Aa83ulSQcWMmoMgcC1gApkF9iinQyCG
	K2ErDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm41fg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 15:16:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so8646326a91.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 07:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595759; x=1739200559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbOpfV4DVLO95imPLnFbxGA0p3PpVX2ZR/gqOgfzH+g=;
        b=Z0LiV3P2MLMyoOaSJ/ljMnUGs/bdTpYHMljVJOEZ1r0qtSKU3EtRJYwy4zFvIYkGeE
         UkgbCpBQIKXA4M/kq8KzvNcizTpGn9aKOjoxsR/3u/kjeQ1dTV4J9q66pVdXVqPEzEHU
         omOHXbapFxsseuKV6939NW2+F+d+FyLmHr0J18HugutXQgZD8g9Whqhk9Ff4gW3VblPO
         xSSe1RPOj/qgW1Hvl4T3If8bnfLo7Imsj0gConWd6qp39fqHCf2zuVQnA9yFkF4Bo/YM
         U6DXSCKyCX8hmed9GD7XU9vNelb0MAJGOt3B2UuEevvqZ4m2MBZzSlvPAZjQfsmGkixd
         Xv0w==
X-Forwarded-Encrypted: i=1; AJvYcCXutmi1/pBDi/effGcrl4d/x7aTvERFiaH+nM0FkTRzDZ6G3Uc7qeYgTmJQuwdWP77OgUHa6+0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu3SgpdFpzpmmBgkdqPUXG7BoajDV+mx6iUIqRnymL4QecNRzN
	sB6QPxCCPs9oUmOPRLWjxxxVONt5jKmk36X/UcsT6gM4hvS5s1uPiZPpOdJQd/OQZiwl1OprRXz
	GOUSn0/WYvxnMbojGDGP9yUejt7kBOb0dbwnXq4XgLHAQouHbNv+SG0jpya8ROZ64SN7G
X-Gm-Gg: ASbGncsJt7fT/O+MGJROK2TJF1YKm8hBi4K/aXtnrB6EzrpRVfOFT7yHztVYv20d6o6
	Dij1ETCWJIrgCD0B4lwoKQiEpleJTdVDle7q72ROGxtN050REGu/wKJm6g8sk71AlkYl0/OfjO8
	VYijTji1FvDRwNqxlRIe+F6w5kYcrucWTArIFQ0iR7aXlQk4ZYWWDi0r35n0V2qUfkNE2ekgq94
	ojySPjtS1WDm5BKoMkCiv3bYU05XmQx4LTO/bTo33lGwjipx5B+vGqeIofAC+3orbkAYhJeUnW0
	AUxH9+oSAT6jEiUSmI2IOfiNI3HntoQ9Z/LGlwTKBQ==
X-Received: by 2002:a05:6a00:a96:b0:725:b201:2362 with SMTP id d2e1a72fcca58-72fd0c04624mr33183664b3a.11.1738595757595;
        Mon, 03 Feb 2025 07:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYUrkJ7xVaQWMC1G1nTizk+q1vhiGIW+1+1WOMLMlj9A3d7Db1ZQ/tItgeo5j/1nrKRmJPXg==
X-Received: by 2002:a05:6a00:a96:b0:725:b201:2362 with SMTP id d2e1a72fcca58-72fd0c04624mr33183463b3a.11.1738595755582;
        Mon, 03 Feb 2025 07:15:55 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8604049b3a.25.2025.02.03.07.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:15:55 -0800 (PST)
Message-ID: <b6ac3212-8e68-4c64-8434-b03cc4d380d0@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 20:45:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] wifi: ath12k: Add Support to Parse TPC Event from
 Firmware
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
References: <20250130061104.962124-1-quic_rdevanat@quicinc.com>
 <20250130061104.962124-2-quic_rdevanat@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250130061104.962124-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pn0guTN42Jz4BlsZncWm-36bVOcXl2nM
X-Proofpoint-ORIG-GUID: Pn0guTN42Jz4BlsZncWm-36bVOcXl2nM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071600_867881_DA4706F3 
X-CRM114-Status: GOOD (  11.51  )
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

On 1/30/25 11:41, Roopni Devanathan wrote:
> From: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> 
> Host receives four Transmit Power Control(TPC) events from firmware on
> sending TPC request. Fixed param TLV is present as part of all event to
> indicate the event count and end of event. TPC config parameters along
> with regulatory power array comes as first event. Rates array comes as
> second and third event as it cannot be packed in single event.
> Conformance Test Limit (CTL) power array comes as the fourth event.
> Firmware packs different sets of array params which includes array
> length and type inside master TLV as different subtlvs. And the actual
> content of array is packed one after the other inside a separate TLV as
> single buffer.
> 
> Parse various events and save it in local structures. Create tpc_stats
> file using debugfs to store these local structures. Create function to
> handle TPC stats read to relay the information to the user.
> 
> Command usage:
> cat > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/tpc_stats
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan<quic_ssreeela@quicinc.com>
> Co-developed-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar<quic_rgnanase@quicinc.com>
> Co-developed-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> Signed-off-by: Roopni Devanathan<quic_rdevanat@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

