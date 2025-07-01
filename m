Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA336C8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hn9BEc329/VEkiBC8gFvy+qU/a3O+eBhve9KTPKFkSs=; b=ljaT9dI91wRWziQxq2joSj4Xjk
	iEWZ/+AW8ZIC9kOLyBM5MaiFZEUWY4WNYfZHlKIgg+WH3K6Dl5hXwloT7iCaxyiS7wLwnRpr02ESO
	TPIJGSwtA9Z/rFz0ifxAWWMoPKNThQIDc+nvVAOXJGtu6AFZjjtbnbgRBFJwtRTbuy4q+2e6GAzxY
	p24PkRHtEXGGSjXculty6jRTCXwDQLOsxewixbeZEBZv3AgZmb5A/Um3MnLjl8kH6d1BtsuUPyHhC
	3MidiJEIwwpXiZpszVtGNzXPaRA50alCB0nNfTZ8v3NtxSvV9qaplYRJ9EuHxtGHNjvDaJKtWy9BL
	DHDQM60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXs8-00000004ggQ-1j7X;
	Tue, 01 Jul 2025 10:05:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWfz-00000004SsQ-4AzF
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 08:49:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614rRTo029422
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 08:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hn9BEc329/VEkiBC8gFvy+qU/a3O+eBhve9KTPKFkSs=; b=YpGP7EZKiwDmWvwT
	Pe/c7qYs7nKJCrc9EKXHIKEdTOCvKkH2yOfGjPBLjXZq1xW5bVWGJy2UDdULOYZw
	JqoXjkUAdzm7TB6XKkYs2iSQK10NGMFh/TUA1t8quEvvI6QDgSFicFp1SNmWU5Sn
	9s+5aPVFJ6HobKvYVXpoHTbvcVZSnfWx1SYzjdvUZhJs94aVOFFKhdOwoCR5G1r2
	mEOrVrYqjSk3279B8Y8OnQtagO5eGqc4vTDujpMS2pz903rPddmOR0yNAxObYR8T
	iMHKGdXYE3Aj8AqkIhgZJXtYeFnPleKcPkVIUFY7XqkaDRPpWwYB9Oyfuzseg5nc
	uyqeGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hys5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 08:49:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311e98ee3fcso5948446a91.0
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 01:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359754; x=1751964554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn9BEc329/VEkiBC8gFvy+qU/a3O+eBhve9KTPKFkSs=;
        b=PSChZhpnsbD0GGQWO2q1Jtj7MgwN8xtybCZVL8Rd314ATw6+P4PdMmr53cr5VAfirM
         Dhi/bgyeslqFUfUjQdAkmbcLNgZ+6q4YaW8BKYjVUbwflQhGXQoiSH5QTW1IbqEWjVVc
         sjq/WvMEzlY6b/XuJOe7k9X50eOk6SoywqmWo9vUtwHkpXpsOTIwoAYKnH1ZlY7NrYFP
         YB2wZ/MKRNV0gwqEeWIx64NL9f6vZm7LnOSUtRfzk28JBh7uTffZ5/fSes35QqD2QiSE
         d+e8A4b3LY3/JM3Mff6FKGMFsl55wEGHPXZjZrE7mkEMvUvhv8jUu1LPz7TbIUXw5wVW
         0Pag==
X-Forwarded-Encrypted: i=1; AJvYcCV81ZaSqzqAxObq6wojbS1YiGlurTFMBXREpTbaZ4weqB8QzWtiM3bkDKGiUJfBp7icJ5SHSo0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSbG9MHCk11jd87DGeAuR3svS9CB2VsvhUMUv7SW+LVSf5708u
	n28mKvtskdzfidHCjyWZ5VhyjQR6nXwRqqwWdlZG5JESlX1w+fI+1HF3t+MUVp+YEZbRjRjCz8j
	PQFP9aZhxEXbCbiH0KY9oBtXhzS4Xbc5XMdUOqHUE7CiG0DIZm+VDeZYxK06v2ccz
X-Gm-Gg: ASbGnctX8HkEv9lr+GgeS8ZApICUSgC6rL13XUcaP2mwNsUUAU/oBPyxwLchPFgo1mW
	ydJAqnAQP0xiD7GSS7Q6b4S8ryd9A/dvApRkrTSIuzQica7+UDIvTr0KlAqSxXvVnk4R8paUIsn
	x1QegR2JenW92uotzLJhDv+EnKlkpfbvCQ0WuAsMVg2dUL2jcoFFvc1e2Ujb9E5qIsRXJQJLz4O
	HdfbLoO15c2ohYUG/izl5UoAqIVJqTGDdlAmRy4ELCV/YZJTZkFlNmSPKDvhk/IivkJpulzh+4f
	tO4dZHHwArCl9W4qjTT8KeDEN/MVZ5HAjMVPFzti3Imiw4rqpfx+dj1PDJDgkfEQ
X-Received: by 2002:a17:90b:17cb:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31939b7bd6cmr4341838a91.14.1751359754372;
        Tue, 01 Jul 2025 01:49:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9SVO++pDakVFQGfgX2YbbH28UoOwYoVlF8NEnQMTAWH/CWI6y7jHxZv9hiemwIBciRJOZKg==
X-Received: by 2002:a17:90b:17cb:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31939b7bd6cmr4341792a91.14.1751359753847;
        Tue, 01 Jul 2025 01:49:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fbebdsm11440292a91.33.2025.07.01.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:49:13 -0700 (PDT)
Message-ID: <58ae0ed9-91fb-2ee0-73fa-321313033a74@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:19:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add support for Tx Power
 insertion
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfXzO4rw9Nx5ARF
 L6HKxxtmUjFZPQqZp5YTeNhnrQIzkWW7HBlthhCdYKAoGTXMiMQ+w+pyQ7xdOLl1bP4p4sgDLPk
 8LIDfZWZ+2ddeHy/nlU6q2F70XAaJsCoaH1EabtB/3lJFSJpGCQkJGDmG6GNqOxso0HbLzNc+Wl
 hFmG0JqKIm6DnqWB1o5vIrp8GXwcBdNjAp0yds9aJO4i2LSnxGuLgJr72cvZUUrxyl5qNS8PAT6
 RB3ho1Rs87xvDaCEmAXE6oKVhxS68ePdtOb52Ln1+wRo+a+7wGo3HVKtko9rZ0gaUaPPjbLOLkK
 ZYQOuL4/XF7tS9zmuPF9/Jnl99wV5N8ETk1lH0fREhqlvgaQINnsw0Zp/pZnOD5jSlNnhqtkFCs
 6UWG+SuoIZN7uy+q+UJ252+d+G8GwUIGeQ3LGs7ibMR8SV+9/a/bj1Hxhf95ENtGUegjDpc+
X-Proofpoint-ORIG-GUID: 7-QnO4NnaLqe8CHln30Jq-QRz_Z6Z4wf
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863a10b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9jhMNZ7qWXdoG8tHMgQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 7-QnO4NnaLqe8CHln30Jq-QRz_Z6Z4wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_014916_042137_E740FEA9 
X-CRM114-Status: GOOD (  13.74  )
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



On 6/30/2025 9:45 AM, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> In software-encrypted cases such as PMF, skip insertion since the packets
> are already encrypted and cannot be modified.
> 
> ---
> Aditya Kumar Singh (2):
>        wifi: ath12k: add support for Tx Power insertion in RRM action frame
>        wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 184 ++++++++++++++++++++++++++++++++++
>   1 file changed, 184 insertions(+)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

