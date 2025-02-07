Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1118C02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysuuPyUUK+0epAqbvA1e4WDKKAmXNm8xC4UpLLzT+1I=; b=1ZxneO105zkDXcD/NgzfaQ9EDN
	qI58n7ZyTEK0+nzR8DP0VIcmCcpbx21txQurVTS1lm3Kw67cE1krgkxoGcsjaIN8UFDYygknipAaX
	xK7fgs0nra5v5Y8Wj4saEAIzmHsegSNabFL7rHzIAZiqO9+Zoanb6qiUhvpLtwdwHdY2ZwEkqZ6kY
	NxyAVi9yUNqHiR63yLiwJ+jVEarse+qTC0pGOKwyhTaiBIr7Kon32mEhkz1zpoeJEOEhjwdRpqMMo
	kxblZGcRrhEKity/pu6ltqVoj167dpxfoFp1L0DVmje3FdZtn00cNJBgNVm4qEtLLTzTBmjAxuX2J
	IYqq1LwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNU5-00000009W2h-0y5d
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 12:29:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNTT-00000009VsL-3Kkn
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 12:28:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770ULC030010
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 12:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ysuuPyUUK+0epAqbvA1e4WDKKAmXNm8xC4UpLLzT+1I=; b=c0M7KmVpKWb2EApx
	F6av/a02YIyzZeA28gN4PQxdASRXeSsXqQskcjVt/NUqyk7mXs4/chU865oY0vu6
	SXrvmFdOwkI7LhP5VrvYOCA4ikp049f8D37sAWfHd/7QngiJgEXxVmoTAAPCBnkY
	csEWLE0SdlN6rWlsj2I4UxqOjr8CsXIttr+/mvoR1eUMYsg5fg3q2zKrUSGNlOkA
	LtkzznJi1dSwDMWjdBGOR06/BXMZ/s24VgYX6wiKXigZkIkfE0FQuPPC1f4oW/RD
	ZyPKiPZh3JB857tM9lzW1CeR2J5OGm2hYrU7uQEBtV3wBm+4znM42XMfraJQqbS6
	esdOQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddjgt9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 12:28:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f63226a32so552505ad.1
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 04:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931326; x=1739536126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysuuPyUUK+0epAqbvA1e4WDKKAmXNm8xC4UpLLzT+1I=;
        b=wC2fErQP+Hi/COm1qARvWsbVVYUydz94zWiaeoH45XyBf9bZgK2cSjYGPd7ffW4pxu
         dmQ6WUyRdvqq04hGgeHGyO+LYBBPeExBU7NMjOSLFd68jIa0nI6RrDyxYm2l/SQgup2F
         JOYSTFOl9MmUK2qzujr41lypa/jPgRo0bnX0V2yJ52PZ+sQBTShi5GK/MnmaZ2vAvY4C
         gxZBHYl8MMndGjECu+YElCjKwdZUeSeIOzx0cXrN3k1U9hUPuIrIgekUigApPH/pc9Ly
         S26FJDM1VUujkq2XgMORdqjlsrCRF1JT7RFhSs0+suIt6GT2E6zdjPOhjaLbDKb/HNqq
         T+AA==
X-Forwarded-Encrypted: i=1; AJvYcCWggc/3ruDGDrQafz/apPqfzFXytdyysPxrU1+YZBXS5otRS1y+PKo0LRG4mNOkX7HIv2u+sfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXaFCx4rzObXA/t8YUFhMO+YR5gfycksFvuQMGwS40C/wSIcjr
	nzZknS1m5G/LaN0cHagqv2WY/Ra5g0VL656fDGH9VqFgssk5mHtkZzYaZkeNfixeDwyoVLjLCmo
	FWGOAc2nJ46BB/nc6wn/7k6FMtUhXe7cEIvLmVBP6rUiIF4zvJkkNLQkr/HNf
X-Gm-Gg: ASbGnctZgGNM/fTXonPnsm0i+DRcmb7ofkepB4al1xIrXt35+GyA8bgHyCACjZYzpmu
	ed7DZsgmhIRGz0SMRVYVXH7enc2jHddSdn5WRA33fu11DvvkstKhUlVQVM3myS07qoLh/cWc0B0
	my2UWnMA1O5oJFUAZTcOx1kfLsLEvheUSgAEwBitWAElpusUmKptdDD+9sEnAW512fKZzGEXSHl
	0A1MAMNVePJ1F1pzUy1j7p4MyQxwKzQtxWemVQUWWhPGoCX2EMMiXHrKuJXcPW6Inm6oKzimIAW
	f/IyKJNwvN8bgH4CbDS/d4OGDuAuKtUf+J9mtrGZ4vWT400OadB8fg==
X-Received: by 2002:a05:6a20:c705:b0:1e1:a0b6:9861 with SMTP id adf61e73a8af0-1ee03a3d16fmr5318879637.12.1738931325243;
        Fri, 07 Feb 2025 04:28:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwq2PgMFum5JkNjGwJN4Ri6j1kKhv1CFdvYxi3UKKeJkwlDtfymX+g9idDLXGWUnY6tIz/Rw==
X-Received: by 2002:a05:6a20:c705:b0:1e1:a0b6:9861 with SMTP id adf61e73a8af0-1ee03a3d16fmr5318860637.12.1738931324929;
        Fri, 07 Feb 2025 04:28:44 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d282sm2859151b3a.6.2025.02.07.04.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 04:28:44 -0800 (PST)
Message-ID: <68712744-837d-ceb8-e7de-6d1cdb14c998@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 17:58:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] wifi: ath12k: Enable MLO setup ready and teardown
 commands for single split-phy device
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
 <20250207050327.360987-2-quic_aarasahu@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250207050327.360987-2-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R-suiUW0fDtjkSYP7aXWhXg9Jz8xKN9i
X-Proofpoint-GUID: R-suiUW0fDtjkSYP7aXWhXg9Jz8xKN9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_06,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042848_031059_758E258A 
X-CRM114-Status: GOOD (  10.65  )
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



On 2/7/2025 10:33 AM, Aaradhana Sahu wrote:
> When multi-link operation(MLO) is enabled through follow-up patches in
> the single split-phy device, the firmware expects hardware links
> (hw_links) information from the driver.
> 
> If driver does not send WMI multi-link setup and ready command to the
> firmware during MLO setup for single split-phy device, the firmware will
> be unaware of the hw_links component of the multi-link operation. This may
> lead to firmware assert during multi-link association.
> 
> Therefore, enable WMI setup, ready and teardown commands for single
> split-phy PCI device.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

