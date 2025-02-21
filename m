Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B494C021AA
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 04:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5lAOYW0ExNZlPYUkLDU1c+fxrdo7zGHF95FfHHanss=; b=KsoMsRWayATAKXgadRr50aqpPI
	vLUZjNAIseznGUarSNJ425Fo4O3ax61Z3z7DlerpjMa/RpDaKnzk5hkFAZdFlqQqUmaT98YhJnokS
	wFM8rb3GwWLmMUYuJ8kFntw2UKvYz/GKNmgfGLo4s+ynKIYsWp9sNVFAvaJCDQs9g966RbosZqu3F
	asT0EvPLV+Nq1jOpasJ9k/lZj1WJxbvPkQnmZS+753sjjeiAgTJ63utweaN44LEB+7cHAIQ0eiR0l
	15EZJqUQtP8srYptqVZiknydqhXl3qrV9ycjIuOdQ/RwAXb2d/dQnaeZw2vQvGmP91+dAv7gptBLt
	ODyYlVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKno-000000047ZH-0WaV
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 04:38:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKnX-000000047XT-3csZ
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 04:38:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLh1hL011749
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 04:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5lAOYW0ExNZlPYUkLDU1c+fxrdo7zGHF95FfHHanss=; b=DcI2Q+0sIs13Uzlz
	TKkWVPkAQjTeE+5HWrpEALsR/9bE1Ck79+nVDx9PwLDsWOhmFdA4yuHbRfjJ4kgP
	jUr7D8RCkyNqi47nto3yMoUL1VLCWRd5U9p1Y3EqZkr2CME6XAnLUsBPd0eyhiiH
	p12TVbwr9pqpF99UIEd9bplrZy9s98DmBlSZn0sIit14fnUWKzBF9zX2mIT1QH/U
	FGQNYZt5PK4zvoK+LxW6IT0xJThj1hfVSPtFB5TAWtux+jn6bCy+x5lMwr5Djbfe
	u9EGGRVKcQC0PXcLg612cSzHTzD8xlmTeqUGNwrhWPoC+bMT2Xatj0hVvAcKliI7
	nKjD7A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xbakvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 04:37:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc0bc05bb5so3645650a91.2
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 20:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740112678; x=1740717478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5lAOYW0ExNZlPYUkLDU1c+fxrdo7zGHF95FfHHanss=;
        b=rRx8lHvkbLMb2wP7xHtQVFKEHK12sidt8vcfLiauAbL+v0wm+MLcbsWpI6A+N0Pg1+
         hwGfvqu8UsxF3SZh9AxusmtlUwe1eFkR4/34fwuG3ty7jNGkfApVtEnOrcpxNPbWxW2H
         9MmhsRMSVtkF9ORBsOLe1uXjHhTvj45YaFFs5n/ylUZGEYdTgVbguEvTcg6gL3vqnHE3
         xme5F66YNiHOVla4PfbkAj78t9U08Wg2KqOWnKCKWoZyHGusC+vy2Ra6rE0bsJzZFD18
         ShC6ZTIQit3MP+TQYY/0Kmv2TZJ1zBSC+OcYlyeB7c32I8MrjgrOc2IIaP0Tih7Oe6mI
         byVA==
X-Forwarded-Encrypted: i=1; AJvYcCVvfX79vn1tNcrfhjkAevmJ7oRUhKTkblwOtTd5sqz1FZoR1kqhYlRafL+ngl+ptjr2QnDWK2w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGkV97OwX84PqmRy9mvDMPiz/Fn4ggP7bo+m+W1fEf9z95BoCP
	iadjiRA4ua9dC77fNv1P3UI000Jyef9z1TTtVFx49XLWziUnYi08efPswicNeZx7qvb8eLfLBlY
	ReSmtNkc2UbONtVWC1mEKNavV0pelPuGPahSULbeCyKRYRGDrLlHOg1XyCrfn
X-Gm-Gg: ASbGnctsiTNm+Bo5d5d9rIw73HPR8+lzWrNyGmTeUTKNJndi+w3b6zzPALcQL/szq90
	mPFS+iPGcNd5GaYafaPsY9Y/0XaMyLiUc3/iNbP8SEEjmroVUcJRFEYJay8WkD+5mbBKSAji+Lx
	WpMRO7Wcc21I9h/K7IXDQB0GtkpezuN8mAreF+b94LsbD4e9ab+NGtLqXUGRDvMiu9kYRryjTH+
	OzInJU/S+jIOnKtEYTAr4GJFG8sh4QTK9XCRUhR1C4LJuOpQve741/CSpL5SchUHrtcp2C/hDwb
	/pSQW/azqSpVdS1QsdwdUZ6cst7LhQE8XiJf6hOB8vXxmbEsvNBQ6gzW3A==
X-Received: by 2002:a17:90a:ec8d:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-2fce78b05b0mr3159443a91.13.1740112677730;
        Thu, 20 Feb 2025 20:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF8aLJ1q0WrbLAex4k31um4F1PvZfcDct1XDrhbQq3n5l8XuaQjKmFWB+Pa14qcGUAM5dm1w==
X-Received: by 2002:a17:90a:ec8d:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-2fce78b05b0mr3159409a91.13.1740112677274;
        Thu, 20 Feb 2025 20:37:57 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d47ba84fsm129408875ad.0.2025.02.20.20.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 20:37:56 -0800 (PST)
Message-ID: <709e1fc9-a898-c7dd-5481-2a374865c924@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:07:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Improve BSS discovery with hidden SSID in 6
 GHz band
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250207060005.153835-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250207060005.153835-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m-2N8056Ldsn0HHgi4Y6frICKUh5kJVp
X-Proofpoint-ORIG-GUID: m-2N8056Ldsn0HHgi4Y6frICKUh5kJVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=593 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_203759_912979_B655DE94 
X-CRM114-Status: GOOD (  16.07  )
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



On 2/7/2025 11:30 AM, Roopni Devanathan wrote:
> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> 
> Currently, sometimes, the station is unable to identify the configured
> AP SSID in its scan results when the AP is not broadcasting its name
> publicly and has a hidden SSID.
> 
> Currently, channel dwell time for an ath12k station is 30 ms. Sometimes,
> station can send broadcast probe request to AP close to the end of dwell
> time. In some of these cases, before AP sends a response to the received
> probe request, the dwell time on the station side would come to an end.
> So, the station will move to scan next channel and will not be able to
> acknowledge the unicast probe response.
> 
> Resolve this issue by increasing station's channel dwell time to 70 ms,
> so that the it remains on the same channel for a longer period. This
> would increase the station's chance of receiving probe response from the
> AP. The station will then send a response acknowledgment back to the AP,
> thus leading to successful scan and BSS discovery.
> 
> With an increased dwell time, scan would take longer than it takes now.
> But, this fix is an improvement for hidden SSID scan issue.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

