Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D072BC3ABCB
	for <ath12k@archiver.kernel.org>; Fri,  9 May 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wUapQOrEwYp132n33ZM87lG9BL1ZkFAOuhX9RAXCbY=; b=ia1X5mOaXoDD1ExCGMXheduxO6
	Mn5aRRCWaJn9X4Qhu3f2RZxj6YsGH3+HNib/YfDv74s0i0Ty9WPnE9//35GVGQod47oQYVdJ6d3xJ
	gVL0Dzw4b2Y4cyP28ta6UEw56C7ESROSYodIkTsLFepvdjOya3sZIE1oSoCzo+MI/F/HHcLscUbAy
	5kgPDbhY3sgvS9ZInWb4/yFGDK3+SgHlAKTXHZf/gOS8ogCZhU5kiJTOyGfvfHLikg4qPFMN2tKLU
	io6OPl082aqhj8+Y2ElXoDA4GTX6+tHcwqJJIWvQYDu3h7teMLoAH1HX+5CL0pUVT3OOR977i0nF1
	y6ZQrA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUI6-00000004n9C-1Xyq;
	Fri, 09 May 2025 20:25:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRUw-00000004R8X-3V1g
	for ath12k@lists.infradead.org;
	Fri, 09 May 2025 17:27:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BsrC4022752
	for <ath12k@lists.infradead.org>; Fri, 9 May 2025 17:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wUapQOrEwYp132n33ZM87lG9BL1ZkFAOuhX9RAXCbY=; b=Aq4RSGKNLykYMGhb
	WB1R461DbyFBxyBfcmhQwSxqHNxGy+pFCuY1W8P9s4hbOleP/H952SCIo6J/w1XJ
	bOvMxwWaYWl176wqbjc5VEsv2Iebf4jpgNjmBzUMSe4BL60nVk0+qwFG6rKUjz2J
	nnYVQLDbTCkeOuxTX90+7W6zTvu1LggPip8JM2HkyJ+DgwjIl+2ao6uYZUvPTAPJ
	fH0U1lRLMiA/QKbPLMTYw8FLNWog6j6zPhukOsy3bEVxxO7jpVDWV0R0ktDDKBRQ
	D+1KBYUcIyfaidBCArg+VtwU7R2BlBjv8zTtsoOn1Lfm+EGnBbgxJTurPomu4gfq
	5b/MIw==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp85ejh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 May 2025 17:26:58 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so43279615ab.1
        for <ath12k@lists.infradead.org>; Fri, 09 May 2025 10:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746811617; x=1747416417;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wUapQOrEwYp132n33ZM87lG9BL1ZkFAOuhX9RAXCbY=;
        b=v1uheXRSz//X081ah0C3PrU7H3YTxsLkPiRtifmRHqvHwZ/n5hjht4Nu9wOYSZV72O
         sr3gLoReNrWqJU49Li9E45yNsfj09aThj+LoMfLdVksD3vZ3DFTBBjcS6XIguXKsn8JJ
         ByFyo7XDrwpT9jcfA/Szdd3XhQ/1omUG4NSib80D+b/YIAuqf07ipwGQ3E/g/P5ZgAI6
         8Iu2bIbQbXk70b2U+xjeZ3jMzn3Db+NSSfjteK7Isa/KqdxBmYIenTFk0dZKiul5K/bO
         MshBf92JILjiLBn0zuPnyOTjNpeGUaizCtc3dYayTNuLakL9WbDqhHW5fXPvQwuLzjhT
         I1dg==
X-Forwarded-Encrypted: i=1; AJvYcCXeCCEodcQ0ttELJe2zAqjVpATWf5sJz0Uzz3GEkVNBXNQq+96ob+a95UCfDT+DRsq+i/DQqJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXNo3m58mflPxoMzyRpAa459UqpU+TwFJ3pi/d6wRExMbDhqU5
	aiDlkM1GBceqUTKSiZm4DvmBdgIEcEnNV3U7uzpD8Z/QKkM1o2tsam3y+k4fZ+eVRgk+nkldIQC
	B3MJWObUg1hPV+uX/YA1K4znCnl1XRqKchGVbMJc0OKx8xdvrXec8B+V1qANpeQrFn5Q9
X-Gm-Gg: ASbGncsCie5vG0U3Yq4MigOPH4mvwK+w3VmryqPNG+VA2t0rR65K1p/SuR+GbzP1lVs
	NAH6Sindo7a6CxrFSd2hNufIHwHNSzUcqWxKJDI6mRrcG0TkcirfW4azhEs4M3AbbjF1s9ebE8U
	2bVVChryeLZYHYB+v/G/pZU9B2wkQtuglsl9sV6LPvGAl0KVYUHnSYIJI1nT9Sa7GasKr3eKlF/
	fGyKiqFsNS/Cp1DyGnVY4eOYjQ7TRbT10NyiI8CGJJuDOnxjdcpj+13AuR7rQCLk8XAelnEKZpy
	iYohXqcyZjoMCPKkBO0Aw8yvd6VU6QakAYXNrCcbgf+r0dvt1LwlGpoO4xZnCrDfLxG7Gd4AakB
	N0Gwa
X-Received: by 2002:a05:6e02:349a:b0:3d4:6ff4:2608 with SMTP id e9e14a558f8ab-3da7e1e7c85mr65852305ab.12.1746811617041;
        Fri, 09 May 2025 10:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE07AB4b/+Pf4nyMGbIX4jP3EQyt3RqCUIg7THoH1pbvrDKMFpM29PCxiYGbZo0g5pPaPC2Bw==
X-Received: by 2002:a17:903:32d2:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22fc91a1e83mr53377865ad.39.1746811606037;
        Fri, 09 May 2025 10:26:46 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb42fsm4697857a91.40.2025.05.09.10.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:26:45 -0700 (PDT)
Message-ID: <a3d69b71-d204-4e4f-b6bd-d7e80bf7b546@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:26:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue wth ath12k in ath12k_dbring_buffer_release_event
To: "Colin King (gmail)" <colin.i.king@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        ath12k@lists.infradead.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <e26e4e8b-90d5-4543-af0a-ba5cebf516d8@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e26e4e8b-90d5-4543-af0a-ba5cebf516d8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681e3ae2 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UYGBsdy-ktPGMqgawXkA:9
 a=QEXdDO2ut3YA:10 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-ORIG-GUID: YGpT7-QTRRbJDCQaX1HzHWTz96m-vcWT
X-Proofpoint-GUID: YGpT7-QTRRbJDCQaX1HzHWTz96m-vcWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3NCBTYWx0ZWRfXwXNhukXcBlGj
 DpTGEdaJyfBgC+4j6YUATo+hx0omZzsRUXzs0VOG2C5g7rY2LXtHSDEAD7QhIjnGpMcLkl7kDSW
 SUh8Y4toiIfVsft1u6QIqooJU3CQh8fZqD5M0H6MJj8iHu0UkURi91Yu+b59grHYA/Kxi6wKcaa
 PKHi/SelSjzIa0ANrgOrY9ljlArVuG4wPZHN92js+e0fq9k31CnD5JwIOtW6tUi3+bWHSyHO2Bu
 UNjN/gjAWCvZf/TRsTPnuTJQcUWUhpc+9eE1ksmYkJjIRt2AY0Yb/t2RhDmMPuIiJSWnBRLByaW
 iZyvCr/ScFQtHlpV6CFh1EZdHn1rbKir+BksAtovH2Gu6JB67ty64oQYqDsjovDH3D+hTeJglVJ
 9E8dYQb7pP9w/nrv4+rQYJbuhO0bBRSTDxYracSdeko05dx2cUj8p0Bno7NbakazynIJWZn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=841 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_102658_884352_B33D2FE8 
X-CRM114-Status: GOOD (  11.80  )
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

On 5/8/2025 4:00 AM, Colin King (gmail) wrote:
> Hi,
> 
> In drivers/net/wireless/ath/ath12k/dbring.c function 
> ath12k_dbring_buffer_release_event() there is a large hunk of code that 
> is never executed because ring is NULL.  The code that is never executed 
> is a fairly large part of the functionality of the code, so I this looks 
> like a bug to me.

The features which use this functionality have not yet landed in the upstream
version of ath12k.

/jeff

