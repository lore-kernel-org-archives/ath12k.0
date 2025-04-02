Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE42C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cCFCUrQHC5JOqrvRDn37HMRKvypTTEHlrfD0rJZRAk=; b=F9qlCwgayOX/UoBiJEACQWgihX
	nZPPt7aEZfQ3s9Y3VVyAxdlf5sDDSJRsxQgVZYDsBWtp7GwTycAU1mg4pUFFsCS3EhV/La/p9AGnt
	G6+CB6CO8lNv724SW6NrOlXd4tCen42ZTxF/7cgs2mN5ii45orkd9jJV86wspBSbWUGs/WWfsP4s8
	ljIXrsnTFiRqCQ2ZydL6A2IoHcsUu7/ncSRe/2Q41mz2xZPCbG0XJeWQogeeyW6+iQ7+4A75K28Bv
	hrthkdTQ4jGg9gej7xJIOfNcwItr3OmgLw2ldtGaje4NGE+J9nl8rGU51HNmAiX6VDN/L5mceYTyn
	GsuOTrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00A9-00000006XXh-1s1O
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:37:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u008F-00000006XK8-0rj2
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:36:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532FGjqW027752
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7cCFCUrQHC5JOqrvRDn37HMRKvypTTEHlrfD0rJZRAk=; b=m4QHJivwBPIOHNLy
	9WzPHeVEyFjmJbwqYDVwhygb8SNLqu4snNMymDHDzlIx7fgRI/JWL7mOesrl7hpx
	kOlhqXUPG8dDfikhb9J3NFi7LqbA4+srH1WEy0T29+mjAtEHZy8m+iL3XMvlmyMU
	Vmr7otsj0ZnY/7Zyb1sSI4BIRG/HuPYTVY5IjEDZC4CudRzd+UI6dZXa+fA8g5h3
	BzFHScH83z++166yAi36ONymirK14WARwxNjGacj2A2aWJk9vQDo0Kb7dJe6hFpT
	g73mh/PxPs+ujb8yAvsqCc+BVIbbuWh9KxDcCEmAQ2/6wAA6xndADj0KNTbn3/Jf
	Kfo1Eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ryhfsms7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:35:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ade807fso35266595ad.2
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608156; x=1744212956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cCFCUrQHC5JOqrvRDn37HMRKvypTTEHlrfD0rJZRAk=;
        b=kkxGhcGpr8nIvQVa5/Fogaf/bX4myViBrOsRevQY/3tY5eaoZXge766NGy08fvG3Qr
         2VXfVtSQjw/NpebqmgXP4pgsjBxZpC4SFyXUENMJi1iuAorSTALcsdofv7Y2wlfPKyeX
         jXADWhZaNlWRkrMB7hNLdOH0kYoi1zFKUTKDeOVSZ6HPBhQ1GpOI2+I6Nntvh/3h/I0e
         E15q/nZg/dbcepmsE3SoL5G1ZYkhrqUFiWLE6BUSezn1NXHGkfEJ3ZeYHT3nd5dsY5rg
         TkAixHc4Z/JGVL/ArziOD3bgM7JqLPpHD1DMePAU1/+mWHeHa5omTv41JpZpjaaWF4VT
         eJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVlEjyP7AhMSWgL/hBoj890JNnt8kgxQbUuKF7ilPblD7v0VeqOds6EJYy3cOg/g6Az3Ooajio=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQmkcIT2gvNe1G4KkW+TQiNkRTKdSr4N/2/tgb7N68KwY3ajVa
	591VNe4bTkDzxW5AeOIoEjb5jhIqi8SdwNgvB/m1erfG60jTkaxTopphQvqg/tAr77FgoGY3YFX
	zNTkba8YNgj1Q5NwsOqf/jSlC/cW59Fhyezb+kWu2hSMaTwvafXbazKxxEmKg
X-Gm-Gg: ASbGncvfa1Q8OjT9naqdaxRv945xF7p3oDEkayP4BgvlcrcPV9Vct/ccHhDikiH/HJ9
	V7V5C3YYQzKVWwyzM3sAdkS1wSb4UulSsnnLrsbcyH0pUFNoY51aODPSE5odUll9OubWVs0n8C/
	Di7+2SKf4AFMUyIDED6gmNxAakROFtbqRNbinMo19uMg/soxVdbNR20nKWzfD+n9bJlzz+PC5RJ
	VAFae87QQMhwD9c5CkPvjd6RIf81hWWzEtj45mNzulcr7T1N+517rL1JNTfxdBWLVpIxy9/K6nu
	j95/FiG6jrMMQrB4JYl2YJF2wyk2Y2MeZJ+vOw2eXJp6FP466bDcACRLOd1U08k=
X-Received: by 2002:a17:902:d548:b0:223:6254:b4ba with SMTP id d9443c01a7336-2292f961fefmr220401345ad.13.1743608156229;
        Wed, 02 Apr 2025 08:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXlf0SUPXiq4h4Kpph5+X3KLRzaw+VTHrDKprYrjJRtQdekEXjhvosj0UnEAz+L/WLG5KlHg==
X-Received: by 2002:a17:902:d548:b0:223:6254:b4ba with SMTP id d9443c01a7336-2292f961fefmr220401105ad.13.1743608155847;
        Wed, 02 Apr 2025 08:35:55 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.201.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedfde5sm109783975ad.78.2025.04.02.08.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:35:55 -0700 (PDT)
Message-ID: <13fc2b7b-9810-d4ee-8b8e-f0e44a7d6f6a@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 21:05:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 1/3] wifi: ath12k: Fix the enabling of REO
 queue lookup table feature
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
References: <20250402152529.1649402-1-quic_nithp@quicinc.com>
 <20250402152529.1649402-2-quic_nithp@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250402152529.1649402-2-quic_nithp@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: exDQ5qwe98ELdULlQeYN1PBnViNL2MSD
X-Authority-Analysis: v=2.4 cv=RrfFLDmK c=1 sm=1 tr=0 ts=67ed595d cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HMRESTvIlCqp6qiEfvMpsg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjUdVDXw5NPAVZ0_mVgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: exDQ5qwe98ELdULlQeYN1PBnViNL2MSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=848 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083559_401915_7B9CE449 
X-CRM114-Status: UNSURE (   9.99  )
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



On 4/2/2025 8:55 PM, Nithyanantham Paramasivam wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Instead of storing the REO queue address inside peer entries, REO
> hardware module prefers them to be stored in SRAM which could be
> directly accessed by REO using peer_ID/TID based lookup table
> mechanism.
> 
> Fix the enabling of the REO queue lookup table(LUT) feature by
> configuring the LUT address information in the REO hardware register
> and setting the host service flags.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

