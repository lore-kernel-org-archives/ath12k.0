Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B3C7EE33
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcESoQNexIsT/AjTnUYA4YX/8ust1TQriqVvjq0z8zU=; b=tKLNwbRc/6f7BScjGsbCGp3vPC
	dzKUte1YKY1/Hts1EgXPlFmGWYrnIIcPcFJ+ndCPcBC9wrJQ1u8MyzwARxh/CcE8nqBNPrklhtv0y
	9I3OM2Jl8Q3uOdwseIQvDXRIilvXFhpwpwPG599Y6ZIfUHdC5TGOfBuBpFvdzINxx7/rdjXtqbPoy
	WEvVbpIjoipVXWNB3pZq3GhDTuZGx61I3kGgKXiY5kDfhOW06+LRW+6b4eLqgvyUuUnvTgH+Z2D6k
	VM9f4g1qGXQOzNNothbkDgUt946mka7Ny2QCu8/Q83gKo4DGm+Lj5CXSjoRzchgawGpPhvnSTuWx9
	rWEojqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzh-00000003hE2-0Igo;
	Mon, 23 Jun 2025 18:34:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTW-000000036wq-0HCM
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Vxgm002182
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcESoQNexIsT/AjTnUYA4YX/8ust1TQriqVvjq0z8zU=; b=GGD1nJYzClKBCRb5
	OdPIkDFPgURfebrWvHCtgFNKQsBQsTq5sCBHPViqjzOCSDPjjKJ/op0UF0anQNdo
	pw8RXz8M5AJ6wDHfQM3mfq5dLCqXGT2PHxRuzMWO0BLZJasR6c3CtdU6TAGSnEDe
	uZDPWfPG7yJOzZWDgYDGnzeYPbdXPgKU66wJqWht+COdV4OtEVJYWOo771KyaGxB
	CLs331x1WHo4mLDn0FFv668btf8czT2TZeLvgEhIVVhjc/YvAp1XPAKrrcIFyjRP
	8klpLgjgIdJChXBBd1tRF5pNwvbJVwRfl3tOdhr3pB/zGsxZaXyL8tEyxOjP7Ya9
	vDro+Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7u9mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7492da755a1so1320530b3a.1
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690124; x=1751294924;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcESoQNexIsT/AjTnUYA4YX/8ust1TQriqVvjq0z8zU=;
        b=GiS7kNZroXLp0o4NjnUbmBd2gPbTE0Rj+0POAOeDg15uTIsImhzSmLwb1wm+deLpbD
         lYJiCvQbAEAGVUmL8/7PD3C2kYdEEh4YON0nMeFDMbs0hmw75ptpCgQCiAYpqFTOmbk/
         Oupl0TntGBeJMX1gOQ/21eRKvg6I96tWeOjr3tYhe8WsDxpFx8gHYe7gZvBHNwhJ8kf4
         ORS7MVSSpWMqH1mlwV5DbhLEsLCIrqLToBNM6Mg+24cehZZGn5mycRHV0yykKTgYpfY1
         UTsxEYpyAbDmGQ+tQ6uf9IiPzwcJk0PCpcOfCTwYWdA7vmFCdlk0zvyyZyYKo/IpF2BI
         rbZw==
X-Gm-Message-State: AOJu0YzTNCG2F7IVvL7vepo4lw7P929kAVQWEGpSV5d33r2IobSFwY02
	867ndwHilUcu4doWwrhh/Sfe648OERr8laxy6MKWyjo5x+kb3Q2snzHtyRIU6E9vHTvJQ3q4Fwp
	AaEe4fKwUsQvrVX6UK0l9yBp/yurPBpmWSnfMhNVDPF44nIb/m+QLIwV4x5RE+JdBOem+TGeB
X-Gm-Gg: ASbGnctwfMRAsRWNdJjmsW7foczBqHlhEjo2JD0fWQMEbLS61+YvPiqDOj2rTQLGJvp
	pNaj1ehqSsd7aMmMWRaDgRGZeQv0ZYJS5ABHOqZanQ8F2Oqjqu+WIYH03/vA4himL5twOwbQbLH
	sN8pRVocI6TmMPyqBs4Aq2WQuehBqhVOlZl/j6oY2NcB1StANDmGO5dTnRKMXRb25xCjTpTkyvH
	9AKc7hQM/Ibh51RmG9YSAUFN7cUCw2SWWlDLo0iO6WJYjPvPN502SsnrczIuGHPzpM0u8AMNCcG
	4Wu3EhEjzsJL1H6xrt2yp4Gg+EA5kvpzCIXdY71NJWayM+CxU5c3tOS29GI=
X-Received: by 2002:a05:6a20:2d12:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-22026dcd362mr18758447637.13.1750690123782;
        Mon, 23 Jun 2025 07:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPi4cKrud61xznT4SLpXN7/4aR7GqNyZ6AuJr/+55M55Lvw0EN4S6Hhx5uVicZoOPqbf0Xww==
X-Received: by 2002:a05:6a20:2d12:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-22026dcd362mr18758410637.13.1750690123252;
        Mon, 23 Jun 2025 07:48:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250605082528.701-1-kang.yang@oss.qualcomm.com>
References: <20250605082528.701-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: update channel list in worker
 when wait flag is set
Message-Id: <175069012258.3758471.5681456771680550756.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: pa7xBe2UxfANHmffiNV9-xljjQv8LPaN
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6859694d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zSQX8QXsPFLw0YBL5ygA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX/twDOzfEl+Uc
 tAg2bY0DdGH7KAAJd1ED/PdouQZqop1B1/SviDZnAxmanp7BCzvghR6mvVHP6vqZdsgAEk2tN7l
 erH/9EA38kSx+b+kNks6mGwlrqevs3PF4WCQKIPS0AOKjIz7y5pCIeuxp8ZeOuBHlYwN6MF+ZOa
 OdnGM68pBJ80RwTblkRvJ+Imwxxm3qSwq62nK99by+A+yEZFAqWGnUx5cEnCyKHXesrpXbz3PHB
 l3qXjKwMKxHwcqlAhAnBUDihIwNEXrJpQ6u44/lmnhe9G5fl0fcIH2SMFFe3FrPL8slOOYPnUkP
 LDzFEx4Zz38mk7HZbLYMvSEMlAOQbReZusT8GzERb4Hpo5onBPnW59Sa09rN6xsBDgcBarI84js
 Soxqgic6GwJC3qB5Dw4fwQqd4ymGcc6d5ZyKPkTFl8f/PaOsIZDskj0DTDMrSESdF8BOgSys
X-Proofpoint-GUID: pa7xBe2UxfANHmffiNV9-xljjQv8LPaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=968 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074846_224050_0E3386F2 
X-CRM114-Status: GOOD (  10.60  )
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


On Thu, 05 Jun 2025 16:25:28 +0800, Kang Yang wrote:
> With previous patch [1], ath12k_reg_update_chan_list() will be called
> during reg_process_self_managed_hint().
> 
> reg_process_self_managed_hint() will hold rtnl_lock all the time.
> But ath12k_reg_update_chan_list() may increase the occupation time of
> rtnl_lock, because when wait flag is set, wait_for_completion_timeout()
> will be called during 11d/hw scan.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: update channel list in worker when wait flag is set
      commit: 437c7a2db6a34db2a9048920694a2bf9b0169726

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


