Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF40C7EE2A
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYXaxidIb6o34oiQEyhpZSqVGpMdSHiutGvzRB5jGiM=; b=115sNUg49lEZdbn1aHTL6mCxOj
	eZzlN2S956b8KEt2w2rUXk1V+wQhT11SHLd/ZDk6w+py9JpEEwcQEFqhjAb61d1pp8vspwDWffAwY
	EbpnPj0PyMUA3fdz8lSxUH5csShmM7ggihC7s0j/C9nX/h1VQNrrN8RNCyQ0GUCDSY3csAK/mX8Xv
	4u9ltzeT2DlaM7zaiuDlTpf3JR4ZCNr8tXZTgkeskvNLkDp0O+ADlnd5N3nsLFYghF6tQe4UwCgbp
	98eVPUodags4A1CblWsKhjT4vTsnmN1dFqeMBanbjzioC7gvmFXYJPEcchgaMSvAWfnmnOAb8aQ68
	tDc7PSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ59-0000000A8pa-3uOY;
	Wed, 25 Jun 2025 22:59:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYvv-0000000A6ed-3Ez6
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 22:49:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PKhWuh002957
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 22:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYXaxidIb6o34oiQEyhpZSqVGpMdSHiutGvzRB5jGiM=; b=DzZsVX6TzJQRs/HR
	bRX/HFFcsIPrDi8G2aPlQdk1nt9qCoJe05Es2nCus5/Um0EoFURMIo22C5Hlpu2k
	JjzyLKchDYcRwLAxE6c6DQTtl8ZCSr8AS6QLlNid6jfiwgtykTfmOLGzoN3XNWuL
	S5rSugxhg92L83UPGKtrNOli0npseIdqyv/S7C/G869I5pgrj0MjWOeGWUCyMBgl
	Xb8F3i2td6retMw8ySDsjiwXv5ciBGAkctZLGy7dH0czNCfucf6CZNnT/8k+SSqt
	WW8cp3leiwDnPCcgB8oz9ctPxwba3ZTE2p1OC3nj0uaqvy0H27YlGXIwVEVm6gGX
	DSIC1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26bm6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 22:49:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e1e474f8so628950b3a.2
        for <ath12k@lists.infradead.org>; Wed, 25 Jun 2025 15:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750891773; x=1751496573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYXaxidIb6o34oiQEyhpZSqVGpMdSHiutGvzRB5jGiM=;
        b=R0hOz9LVkG55bhVW4XSVoJ1X1jGc1I/JNp6ArcWgYSBQIsnaz6VPkAORw9hgO5ZwcW
         5fD22+fMDPCx2yWKDA/qqhS0cTZRWtAMlNBFa9iuzyAaaXQL2bTKZPZO2jjEQXpycvhX
         kzDVv1OR6IthKZKw6Lz5yA732OwLWtiBzchvdCrmnmeLQJGQ4Jbx2VBbQxMP7x+potU3
         PfFfIGIXfqMhw10U76mIeEg9k0UE+6KkqEap7TvUVD/do8MovJBK/aWJMqMr3s7dyL6M
         JT2Bo5CIj0sA9WaTWLQdF4xUD/gKx/wDuO94JzliFiDnfk5vrnn47mUCjOgN8ojHyt4Y
         NOJg==
X-Forwarded-Encrypted: i=1; AJvYcCUp6u3XdHSJE+T7rqabbF9FB/r5UPmFLn9bLv28OcB/l7Zq7b0g3X+TreTXF7ASjEqSrjBR6Aw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7nd4sMWv14nKt/R9YdGI4PSlKg42S4cyBXtTDffW4wGENsCR
	s8xWIqA/QgaSHyCGC7qzeqZnpk3Yg83llMztwJgfGpMdZPet7K4KXzaU98qXL6xm0XebVnhi4it
	fA+/mBh7LTBTc5XDSGwfcfwSkVLlyXsU3W4a0r+8lz7C65SJZSSIZVdJKnJUyfBRw
X-Gm-Gg: ASbGnctMA7b+3+xnU1zJIEfW0Fqu4v4MUfRNHzv/sk38wv+9DHNjrc6u8zAjA3rsLlu
	y5YI/7LWtIiPPs0e0Cn4Gch3jr2XDy5eoDtvK7qlvlkDOZUWHucfOw3bxDqQ70wadf4Y2ll3S6Y
	SHp1f/YlMt5dnRRxBW9BVyj6qWYQVj3oLepmwv2/x6mKPwy47W2PGvXQOxOW50s/sWvSUAwjt1H
	6SB9Nju1BmBM/ExfMDcsADJQDiFM9w1loGK6KyluNggIzKqJkqPBuOFx5x6mH6CbpcnXFODFHQR
	9SbMGEFOExtxxtyzHFyYifELvMQpGHGTB6vfoBY0hw8CnqE1GnQtyVWsSH+65yQ6hN9TsZ/RWSQ
	I7X4JoCTdc8UwOeA=
X-Received: by 2002:a05:6a00:3d16:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ad45e6addmr6632845b3a.22.1750891773224;
        Wed, 25 Jun 2025 15:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE54s5I4oNaz+6DdNq5r5PUAHS80ExntzXwuXQWgZDeiN9B9Uwzx03BnRvYfw/dYhBnX/LtMA==
X-Received: by 2002:a05:6a00:3d16:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ad45e6addmr6632818b3a.22.1750891772820;
        Wed, 25 Jun 2025 15:49:32 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872c7fsm5252175b3a.167.2025.06.25.15.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:49:32 -0700 (PDT)
Message-ID: <35619c11-71e8-4372-b38f-7f1754c777aa@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:49:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
To: Johan Hovold <johan@kernel.org>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Gregoire <gregoire.s93@live.fr>,
        Sebastian Reichel <sre@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
 <aFwOVGGHOHbko9So@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aFwOVGGHOHbko9So@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE3NyBTYWx0ZWRfX4/0iWz4BqSrm
 0hrp2+woRxqnsJpWPMbJIt0+81Mty3A0EXF+S/4PMi0UIuHRJMyVxSRrC0Q5KNsUsmxeG7RbnhA
 lyqVJIstgYEdj94AMiNnsi4L5+kZMw/VkiABr3WVSF3YzEIxYbCIcNinM35fXXZMjUPJq5PPfP+
 rpdLiHtfv2ZubLz8zlp62wEUUK1wR8ibHOwySuZ1WbhpXKzqXDsukifkgt3nY7wVTm8xFW86vun
 JhTUMcal6A2jtMcAuKq8CDUhZQT8/Q2/sbe4RRqK4bVqwF1hxO4Ju6gt6tUJLxlv9+whbmW//Y4
 /4TYV+rIR3qlB02QtDWKNX0pq16ZriPQnUz8Rw4BfLz/E5LYb8crJoZ+FOnM+NkD/PRXmRdde6X
 1JNKwjH3susssACHuV1E5qF3l2vNL/fUTnRkyTueXwGswz4hVGFF47Pc/hNmpmoTjQZ1hB48
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c7cfe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=LVwp3io0g4xlkmLrWVgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: KpRHV4I48Ym2wh48rwMN1KLKyCrE3MUL
X-Proofpoint-ORIG-GUID: KpRHV4I48Ym2wh48rwMN1KLKyCrE3MUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_08,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=892 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_154935_841887_F11B31FF 
X-CRM114-Status: GOOD (  10.87  )
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

On 6/25/2025 7:57 AM, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 07:48:54AM -0700, Jeff Johnson wrote:
>> This is a 0-day issue so ideally this should be backported from 6.6+
> 
> By "0-day" you mean it has been there since the driver was added, right
> (and not that it's exploitable or similar)?

correct

