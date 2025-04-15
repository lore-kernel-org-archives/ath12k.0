Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D44C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68zxaR8Rk8J54M5CK4OD8Nf5704X4rrP2izr3pG/fXM=; b=G1p1o1BZXyz0XOiybrts/om9ye
	6JYs4ZDGFZntDysDBsPnpdRyf/3OsqawNNsmwYIt8DP/ud0H4g6QhcowQnc3T28pFn1xU8h6RkMW4
	VTupu8pfDxSkRCw2HIzrxbaZYOVK5subHwNVLZg0Y36uqG6NBpDomZHIiMlUrsucX9k91dr5W49xo
	Wb47SEgf8YXHybhqexOwVusR0zeiy2egHVxVBop8AwhVUJVaP5O3bGwAtoSXMcYIsr0gjV40tw+OK
	RomJJBKt55yfCUE4xRZOQemW3t7OTgaPnm7T+OW3tJckSggxpeub9bUEnPPnhB7vyxKYzPqOEpPY/
	qkZ79H8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kWq-00000006e1I-1RQV;
	Tue, 15 Apr 2025 17:57:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k6O-00000006ZHn-36xp
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 17:29:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FDlTET026877
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68zxaR8Rk8J54M5CK4OD8Nf5704X4rrP2izr3pG/fXM=; b=FzRHpkTeS5PMR75u
	7wlx+IZP2wkjAIo6Z+kQuwqXXPkpVBI3hWYpS7ZwPfzBTbEBS1UATS8QM/4pKrAG
	PWB6yj4UA7afXfNz2a9rUWo055l3z4UuTvhimS9IyAcrS9ftKG7M3o+NcUTIjUq9
	WMIGjmz4xNQZW3n8uZnMi16pHtPZSZoc4pA1r7oVvkX6KBAA4Zx0NR5g4kmXwtxJ
	DM1KZRrB79yQBs2G5MNjPmKxIyey52TBkQiu1YCYHnP/omWsRXFP5NabAslKvzIv
	7ACF501pj2j6XyhJCWF98oivnT81Pe+iN5V0GpmTp2dI5Ct7xiRch/zdeg8+GDcl
	G4LzRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbprsah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 17:29:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227a8cdd272so48420335ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 10:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738178; x=1745342978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68zxaR8Rk8J54M5CK4OD8Nf5704X4rrP2izr3pG/fXM=;
        b=W2njnixmHeEJGcDBQ55zx2xhqnaSfQl6qRVWzQwhAlTwwMzKC9kU6Pzzn8OpBWdg5f
         9hibfg5IE58DrFRyTNyWnvgXtuwSVOXJohdfWybqcmmLouu5kOo2itXpJnHPO415MeM3
         NA/DBIMmCy4dehkgnAgsOfoGGAhQB5rPeUTCHkz8bIS7FRrC7bSW6KNhGh2q/uviTrPn
         mLqV9C3ndG9lDaeVo+WJhyc26HghfI5X1VDGO//QJgM16br8tGHyqcWa3P/Z6LusxXtE
         AS70BLKKFiGz2Fu9DxoffxIrjAlXrqxlmyvn73Cy2SgnxIkzA5NPSBD9L/Ms2rcKSCkl
         bTYQ==
X-Gm-Message-State: AOJu0YzYVK8oWR5bHokKRDkQr35dJmFfMdTKxXgDMncB7dfEsp1WFJoT
	NWR8p04bw3WrkPpqZA+7dOg+iAZJGJp0ieEXZwfaGNg6XZG2hf4MixB6PhhtdkXBUmhKmAOqpNO
	YCxuCyyOqq04RyPgX0bRPSj7eaudKrAcCQBHvWTtnl7cx/EFMaw2uEnpHsM1r
X-Gm-Gg: ASbGncsN4lYBbGX8+5eV1nHFI09hKNwjtYBRmZCP+cRb5ddykYzkYBYkRSy5VJlCCGJ
	ijqM8AVzNWn4tO5Y79Te9gQ/7HS/R31ileSBiNYAMz8MVdXLZ7PlxFTL9Vwv0JP3TzNrYlMLj+8
	xjNkfz4Qo9xryso/wf47HWqlJ8hDYMK2edW69FASbmwEVnCsPbWVN2HtnXQCj/VYNURaJFEJJMa
	qP0XFLhcufeNJGhj8wWyVk/b3gF6jJcsauHZXlnePqXLmw8PbKh10zaQaH2ai+FRZ/6ro8bPvA5
	DWU6sEt3HFVv9tE7FYZwdj2NQmF6kado4jQy4e5Kh47V0MBW2Kc5r7O5X79Pf7rqZog=
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr277869655ad.28.1744738177739;
        Tue, 15 Apr 2025 10:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8L87C2PUH81kzhhjelJom8UKgFRRDMXIPSGtzV7/a1Rjs40pFRM+XH7SuAR/inuj8vxFnXQ==
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr277869325ad.28.1744738177389;
        Tue, 15 Apr 2025 10:29:37 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5afsm120874155ad.226.2025.04.15.10.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:29:37 -0700 (PDT)
Message-ID: <7755fef1-1283-479d-8e15-022f06547e26@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 10:29:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Abort scan before removing link
 interface to prevent duplicate deletion
To: Lingbo Kong <quic_lingbok@quicinc.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20250226113118.7626-1-quic_lingbok@quicinc.com>
 <46030c46-a2ca-4d02-ab51-3581f7f3ddfe@lucifer.local>
 <21ef1321-b079-4749-a675-dcc814f9373d@quicinc.com>
 <4930255f-87d7-49c5-b53f-6fa565cd3a56@lucifer.local>
 <6438380f-ec71-4ef9-a737-99f4a45184d6@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6438380f-ec71-4ef9-a737-99f4a45184d6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ASnbE2CSQJBEi_6PHJ7tnrru37UHheSR
X-Proofpoint-GUID: ASnbE2CSQJBEi_6PHJ7tnrru37UHheSR
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe9782 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Zjz8bImEkSRBnUl0h_8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=775 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102940_810425_AFD7A6E5 
X-CRM114-Status: UNSURE (   9.08  )
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

On 4/14/2025 4:10 AM, Lingbo Kong wrote:
> i'll resent this patch rebasing the upstream code.:)
> 
> thx a lot! lorenzo.
> 
> /lingbo

Yes, it needs to be rebased...

Applying: wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: Abort scan before removing link interface to prevent duplicate deletion


