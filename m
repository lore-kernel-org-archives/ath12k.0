Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BB5C77B7C
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyJRjp2BC+daF8rBAqDwQ0jizpuQHWR1yMahxWZ+7VU=; b=GbvqiIR06Qar8wIlh+qfNWa/07
	KmRX7Ruh98S380VBNjCNe3Qg58w5FzD8C35p9AYsOvaWr9k24H5zW6lIrBgQkHFD98rWavIAgO8ti
	Y0dYEIF4zrSHpysG72CXsjXYaFDqW99DKu386LMRjh4lvmz0BJ06OXxmuQDg30J2AcXqNnqejxxYg
	PKQzpT2cwJNLDG6Y/0AyndUCW6h0VyWiPcFYzB6ngnejv7Fyld8PDGkif0XZlvwz5HOZYDxStfEV/
	JOnoxGG1dVqLjqSMJk22caVbJDER50BCJe2BHHWt4Wmy5zgU5h9OW7pygIUkz5iGfA1+ydCCawcd7
	4ertrDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jz-00000006giE-40Vd;
	Tue, 24 Jun 2025 19:55:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7TT-00000006Nxu-3fUe
	for ath12k@bombadil.infradead.org;
	Tue, 24 Jun 2025 17:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tyJRjp2BC+daF8rBAqDwQ0jizpuQHWR1yMahxWZ+7VU=; b=eF/XstJrWDD2KAv3I3sR0br3ok
	FwVY2p64TdpH+9MFAZ8w3syjRSXByyb4Fn33KyayLUBqMXEAWSQM8ObAytY/mWY6JhvYxv9WrQMla
	KEFNhJjUGpsnWNEkmzERCJMLBSpG7BKMB2bk9hxRfr1D6sX1OLx5jJNKMxYN86k4OgYB6ZMIue6kq
	EH8+JnnRjPfs3pkN7gybF77vbiapk2yMerw5BOpnOs3zeU2+SgEOP0Og/GN0UZx5ZzUEmVAARNFuQ
	HgehWGW7lqGphDvy1aJfhkFyMahbZf1b/y8bII86C2AaOnea8N0QdMppmwiY24Hu19m04+mHq1RtM
	dIMiSDpA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7TP-00000005Wae-47mx
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 17:30:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFKJgh032648
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 17:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyJRjp2BC+daF8rBAqDwQ0jizpuQHWR1yMahxWZ+7VU=; b=EUlp7UfwxE9aREU9
	OtGgKAwrLHK/xXRfOyDYCJGAML8fR2XG8AjtOACJ2vOihqo3bRSBXh7H3WZXJJ6n
	5a3WHI2crNL85cK5AUAX4+L24h6arIPA7qM27V0ld9nmNhXX1vvkX0jR7FniPUGh
	BoybdN58JdHfEOaJCDHU/sIw7JmMV7dFMreXghVaHq0AcRFxYtLs4UqXBttNInYy
	DeajbIsjDLdUrPQkI6eRFOGU3zWlm2Wr+6uzMtu9ItupW6EXsEQbxBoF0RQqxrzm
	yVKJWVLXTvuGDF/w2UtRW24+7HMlz+W64p3HFHQr5cJ+DwxCEI5OEI6eWlF1eZaK
	fOhHmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec267c3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 17:30:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so3588252a12.3
        for <ath12k@lists.infradead.org>; Tue, 24 Jun 2025 10:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786215; x=1751391015;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyJRjp2BC+daF8rBAqDwQ0jizpuQHWR1yMahxWZ+7VU=;
        b=iya/Y8conu6+2uIiAovKiF0U5A/TQE+mbGKv1w2fKRcPz2Ts52IFcw2DVSQlngPSHk
         Kmtk9KNLO98XuCkhODYSrGNFdKYA9d8bGRTb5aQpQPEJ+lvX5s6QiP+Gue/sjfP+1t/z
         ct2MG0v3uncdi/irtkzBEC306rLRbq89oEoQSQ/IvolJu5zj3Rxyf6Bl1jJ3YMWQKUJ2
         A0GUouM8JvSyWyH+WmLstkLOKBv4ZTm+2NBNy9TD4Nl19atxs5W6jt9Si23xKe9Eodw3
         7QgT2dh7sOzN+95+vPZhSSFrcBEDMOdFKJxLYAklppS6pXT8alqEIDWADDO4Rn8e3iPM
         ddhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2OHJTUgC75DH82NSbzmO0HAvTS8WuRTK6XsAGrA86s/bCphZJuhcVcfkWuze2/hFHSws9Bz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAqVcIJCxpCnCVWUUbBDqwHWMXGBtR7oYZ/GORBBduZP72HpNw
	/mDzPbCbxq++WdZN5VhdR/aCEVBySNcZLmmks+cmFWvMOHds8wCn0rEPtvrbpzK73Kf2qv83vdS
	m/M4z2Y1p3QLos9h6XyIjRwxQnn4ufyEmfelEo0/18yZvRqk6iHqAddP6g9KHA50p
X-Gm-Gg: ASbGncvtFvg0TqMlXBECmM1W/Yx0rwUnGz4Knbl9cyljtq/0sn5mzUS5umzEqgqCelu
	xzv8LpxN6d/OQK/4Rg7QlkSz642KyVCZmh6Ur7Psc/BqQnWyQDQ8ffhI37hcArdW+qd2D6ae8+V
	wW69mHsxr1nopW6BWi7NNeiQDoyN8CYXX2Em0ARzvZLHmDTfJlbNTWIFSd/+IJw3DQomyw5oLbw
	RXPE0g1O2ai32uHhApkukHA6KKnblq7n7Bzy6S5tYp2ovEPn0DPAbRmLNzp0a1R0OKPEoce+cOM
	/rg4ExOXaqlQwfn9IbeKGB1bngHXIuXJcxQTo+itaDu+5eeeibwZhifNpwUzbw+uqilhWW95Amp
	/5bnMRrZafVErLXQ=
X-Received: by 2002:a05:6a00:1817:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7490d758681mr31303378b3a.3.1750786215211;
        Tue, 24 Jun 2025 10:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES7z9d8vjW9wocOUQHzjnQCbI9qB8j++QdFNu9+XZhCz61AqzxPaefqRHEfG8CpjKAP1LyRA==
X-Received: by 2002:a05:6a00:1817:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-7490d758681mr31303304b3a.3.1750786214605;
        Tue, 24 Jun 2025 10:30:14 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cc78sm2265801b3a.87.2025.06.24.10.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 10:30:14 -0700 (PDT)
Message-ID: <14928304-c4f3-49d1-8a9e-d018ac699e90@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 10:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: add module param to control MSI mode and address
 width
To: Govind Singh <govind.sk85@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250624165031.58616-1-govind.sk85@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250624165031.58616-1-govind.sk85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE0NCBTYWx0ZWRfXx3vBEsAmb2yU
 mXSwiloeI+DbyR+udOZOZTlNAcuBmK9WrxAWiN4mL+ajZGnMMsHeDDHc7pYrke2sQ55iC6SqfCA
 1byaGG5EXBErjlN3IQc7lstPtQaDiclGyGmymakz+ye60cbqGI6qhiB7nppP4V4Ih36mtFGwTUj
 D63h64BP2YKnmFv5i3TyjHZikLzj8U8b+2AOhd1FweiyYA3E01WhA8ktTImnRdIDHFiaMYcVqbu
 bdGveO9vgaVH1l9YvS4x3Puu0dnglsxS4HWDUYKpaMiTyFCY0Yp7tfwSyoTAs1JyAgA5wCxR/b5
 F7ieM+q62bRSA2jGonjee9FFJyVQQCLfZ1taye8QXEnfOa6jDWv8wP9cf+w47EvYWR1A1ke3oxt
 uGqWKZSTm/vPVudaapZfwu8erTCstqOh/YgKayzwAN60JdSQj1L3tMpej5iNCQn5/DzcHY84
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ae0a8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=oBaBJG5FjUdcDCMQZ_8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2M50Yjy9FV_VxKVcxuypBCP_ImjP4GKU
X-Proofpoint-ORIG-GUID: 2M50Yjy9FV_VxKVcxuypBCP_ImjP4GKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=844 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_183020_478117_EFCD92EF 
X-CRM114-Status: UNSURE (   7.13  )
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

In addition to my previous comments I now see the Bugzilla record, so you
should add the tag Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220190

