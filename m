Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D55C2D0CD
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/T0gQauXa/ft2ZHRp8KMQbczqbe7LRrSucsbMP5v/Ok=; b=dQZwqsHOxYQRUtJsT1pfKrqm/m
	3i8sJ8lqOI5x3kjPrdZWLR0L85HKKL7TJcNI4PMN6vyi6C43KOa/YhjEzkVSRKCEM+31+ynfabqjz
	jCPdHRh+q0U/aG6eRoAU6nvA+PyMGeRNZBFD8trJOVe8M2KWuXWY1GUEzqhQJynnydsjAoMufEPxq
	+WutZAAotvot25yES+UTMa25ng8Pq4b/fH17QzIvyocoq5IyPu/ifEgU9AuGiShkgnPwR/xhuKNQj
	RQ5OQQKpbVcGYPMCthOEBIkB5Ywl8SRCrw869FxbSlyL6y10d9FvXtfBS1ABv1U6kiOMMLGhZJY6w
	+jhZ+clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdBv-00000001Wss-0Y6x;
	Thu, 15 May 2025 18:20:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdBs-00000001WsS-1siz
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 18:20:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEs4024609
	for <ath12k@lists.infradead.org>; Thu, 15 May 2025 18:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/T0gQauXa/ft2ZHRp8KMQbczqbe7LRrSucsbMP5v/Ok=; b=ix+Vd4W6VBnu2XFg
	0D28g9knno1jndoegUxnC3cpex01RYPBDcGqQ83lQ6c46fDzMIrhJm130ev+3K24
	VSY7l/l02P1183K2oQWcNddELtAVps02oJbZ9XhEDT+A83PEvZk1KvIYqR1PGYgP
	z0vymjp3P7ycwBOIOxV4ZZLKLReq0eAHS3OPxShzDT3Q3dQpaTScAQDttQWabvpf
	8fm2q4N/LXW77uq7A+HjXHLrNTrWaMoatZlOD8BfwJR6TuZw3xB8eomi2+Na/542
	GE2QsdjlTjO/h0aNAD10JzLU6vYINOZJZOxWv2ScuhPzPtjw/Hl0IwEJiQINOjxH
	L8FTuw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcny937-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 May 2025 18:20:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22fc829046fso11716675ad.2
        for <ath12k@lists.infradead.org>; Thu, 15 May 2025 11:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333218; x=1747938018;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/T0gQauXa/ft2ZHRp8KMQbczqbe7LRrSucsbMP5v/Ok=;
        b=H2qAOFGimPk/KgNHuN2DZbzMF8YrrEVQV7M8IW+U19BORZ368eQqISjaz4D1voPM/9
         mKEQ802gjmP9rwwJy09Ku9LBlaTVyR8004hg02kCVgzIz3NGoPFGiQ40LVI60Zgz8Kgz
         1+xyVGaQY3bO9M9Z4S4ZPogeY7iSQwJLj7MkC/xFvdiK7V9zPTCLoG3KwRgyJNMfgRCL
         H576DPbteBzmLRpKM+O1IWX/+f5fnnfX4n2KHVkAlHf4vWnItujN8GyDdPBv+g8bvgGL
         +ttgs/6rriv/32S1UaiVlzZfkBB9PhN3ajK7vbWTdUaiw/1qL8arQEuKELhw+j7h6NF3
         yYXw==
X-Forwarded-Encrypted: i=1; AJvYcCXNKr1KyJBmzK6t8e5HDLlQr3C06weWlr75G/RJqSRDZOF0UZ9TLgAdmV8pmkAYqrQeTSNFwC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAorNuCMypwTq9zGXJveWvJBWsuMa7c3z6K+5O3VrAsF7EXH92
	XP9nq94WRItrsf5RLaI4KU4zyMnbq12SM5/q9Ml9iV5PRPnjrwX3dRm2jaHU9unanR1teGXvvfG
	QbH0eCZkdQkYmCI9gNwR8B0hdQJX3SM8oRpbUw4pnNb076DIMGhiNFaedku1OQfgj
X-Gm-Gg: ASbGnctMuHzUgGxX9dp6I0JfZHPMArUTCnjBD2gLDYSSGCepfznGZm66q8WVc8eNSYa
	F3xYk1FeElE374FBNNn+0iAq2P52yVfVoULP1AuMLhVY4Z/ERFmB8WRkthPOrN7GlDbS5nVFDyi
	BgDjD1wj5o+N8405NImn/gbQg8XZixEEbX2ELN4h2Zvo0FAzXtUSwxpy79GdLNvSNLcaqk/cOuI
	xUyMjGFz4P6wjVude+OwKo0maSg7j0/JMvIHb13soU2h3aAyhsA89HRUf4SeUOpyGtJjPeAso7Q
	ONLGGzoHn2jqZAraWBU1d7nhbOOFvYYdi+BBB7vonYiNO7G4Hye2JJPFhFIzzVMmDmQ=
X-Received: by 2002:a17:903:4b4b:b0:22e:6bb1:f717 with SMTP id d9443c01a7336-231d452da38mr7361055ad.41.1747333218485;
        Thu, 15 May 2025 11:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx5bYF/rzLIsywGqbz8vScGQIyVSypJBLovdyWgpilULyiGbEcK0yTCLXsjJbs14FK7DiA6g==
X-Received: by 2002:a17:903:4b4b:b0:22e:6bb1:f717 with SMTP id d9443c01a7336-231d452da38mr7360665ad.41.1747333217949;
        Thu, 15 May 2025 11:20:17 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm822345ad.110.2025.05.15.11.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 11:20:17 -0700 (PDT)
Message-ID: <ad255f5e-d1be-42e0-83ca-40fdc4eb25a4@oss.qualcomm.com>
Date: Thu, 15 May 2025 11:20:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>,
        Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com>
 <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com>
 <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com>
 <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com>
 <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
 <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
 <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
 <e9da4ad5-52cb-416d-991a-259140469e2c@oss.qualcomm.com>
 <87774003-d0a5-4408-b710-20bd3c194cec@quicinc.com>
 <CAMb39_ntK9Zv3pOuMSza5hRfs_KZBhya=GAPnpBWjN2wZDst9w@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMb39_ntK9Zv3pOuMSza5hRfs_KZBhya=GAPnpBWjN2wZDst9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p_b8cKCmCMTayAM5BIkgvvIB-DS1smsK
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68263063 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bC-a23v3AAAA:8 a=3HcdUk5iCOaaV_Z1s7AA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4MSBTYWx0ZWRfXzQBPunfMJvAO
 OchDftAojW1CCCeJWijQcqfl9Bhug48oySqfWMuDm+QbmQRndnm6Dp3qx2KgDyeyduQhLU3ykri
 t0XpethZqHr5coqSH48CNkmDUqYZURyU8n0PptbiIFfWKQbBzSY0VnRPQZGOlHNAGEWIxtohsfQ
 8VYjtlycGf8pP2ELri3j7si62yXhc1vFxAoPr9G2kVHoNXS2QgjIQHxhffepxo107mt/KFfNZ7/
 v87eZbqoaVE20NGz2Gjp4wWtkCbh8r3haXBNrmHcr/a8jidRtzMqDTJ4yY17QIQjjUbNEPYv9oH
 hoijTxvPZ5WQStHFBh8x120JUacwuUVXXLLq2mpZg8QOs/wIVrkwyi2DvvK77rToXjYByskcYRd
 wnzCWq8hg9qIvjqD99igwHostx71pTknw+E44UEnrg9k3f2z86gV4JClR2rTStaJvTCgAfq/
X-Proofpoint-GUID: p_b8cKCmCMTayAM5BIkgvvIB-DS1smsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=752 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_112020_496674_F2B9A895 
X-CRM114-Status: GOOD (  11.57  )
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

On 5/15/2025 10:47 AM, Walt Holman wrote:
> I adedd another network with 2.4 / 5 / 6Ghz settings and still only
> connect to the 5Ghz network portion. This is verified through wavemon
> and the AP. I saw some patches recently to address 6 Ghz operatoins in
> various modes (https://lore.kernel.org/linux-wireless/1692f2f8-c77e-87ce-db70-00b4d9fc7c95@oss.qualcomm.com/),
> but the patch doesn't apply cleanly to current or ath-pending. Don't
> know that it would help, but it seemed interesting.

That series is already part of the pending branch, hence why it doesn't apply
cleanly. So ideally you could test with that branch, but there are some other
issues in that branch that are still being resolved, see:
https://msgid.link/7db2e4b5-377c-4d3b-b51f-290accc9ddd9@oss.qualcomm.com

/jeff

