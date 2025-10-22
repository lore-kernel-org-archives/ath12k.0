Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023D9CCD195
	for <ath12k@archiver.kernel.org>; Wed, 22 Oct 2025 04:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYIRQ7B6jRrorPEwy8/HTa8e3SUlYSB9bsTlCadMTx8=; b=XDyxTEH6DjHkEGagl50k9ZWz6Y
	gKAN3wbyG386t+xp32tMhffnOUkvVrHZe3JRN+eSZH9sQln9Um2XEn/4lTUpJ3E5KIMhXT70cZXJb
	/xV2GqV9Z59s71lhaw0Nqbt0XjdYsMKj6dk09vQuP8knGK2D7Kg4DZ8fQmDqn1RNklgWED/72z5MT
	2uPVE/eobdyOzc1M+l8k6HkbO2GYvmj61bz3SkF5dOTpMgwJXuEDmBEc2lto184ZsX4YJ2oM8Qw/4
	0i+GmPhVCEy9vwZc3ClO6fnaYfxEzk+DC8NKkxo/xz6axRQa1mrRQ+OOTTtoAgxhKl2uAQbq6NjcF
	lg6pQVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQ1j-00000001OTE-2fkm;
	Wed, 22 Oct 2025 04:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQ1h-00000001OSv-1jlb
	for ath12k@lists.infradead.org;
	Wed, 22 Oct 2025 04:00:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3Ud6j024982
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 04:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYIRQ7B6jRrorPEwy8/HTa8e3SUlYSB9bsTlCadMTx8=; b=GaXEME5U/nMJTwHd
	1ROrsG8wFT3hh7yDIorKcp157z456dtVwkvpFiYNuUPnEZjf/A8vVlDLrupiLsuO
	jQAZyB5REvmmIoh57Y85osvKB1gXxjxTOqbcLeJpVdz0jXuboV9LznJIEPpMgGPE
	IeYg7iVOP3BnhwBLFEMXfI9ITAWAOjMmvmzVjTWLvg1NDQa/qVz1vDAKe1YpIqeO
	jRXJ+n3YtzjPe+wz3ZCP60tSDGr9jGZLzI6XAAmfHi85GOzbnnN3lo8h+z531SXu
	aTXjdXIHBLFp+NyuMpHOfZryvKXdtc8/PFmdgw5hIyCKB+sqSWoUafk+v60hQz6z
	3rnS7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w836d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Oct 2025 04:00:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810af03a63so13410218b3a.3
        for <ath12k@lists.infradead.org>; Tue, 21 Oct 2025 21:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105638; x=1761710438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYIRQ7B6jRrorPEwy8/HTa8e3SUlYSB9bsTlCadMTx8=;
        b=QpJqtKNdibXbuDy6MbBgVLYgqYd/P0JCnN5MyAIZc6aoYlcwb2uAi9SPwnQeQ0S9lm
         beWihLAv4s9RJq/WCSkbiIh/l0GmHD7TVKrhafilb7bWutSid6AhEnGFelh5S2Rz+AjN
         uArrFJ2cqaAST/Sbs5hDE9VkWJtgjGjmJunWXqx+64aZDFkhxxmhS7y9P3uXHHXIpN2f
         RJuy/Hv6yoz/K/UVeVaGkmoH0lU6YcJUyVBBouZoq4XZpXcXOmzU+342hKMLZdttV+61
         9GZr10zpIX4J19NH1xb/kGH0ofPRHMkSkQZviGy4Zua5sgyUf4xoNpPmFjQ/2f2HYJGO
         bGow==
X-Forwarded-Encrypted: i=1; AJvYcCU70HcON38Pa2ZTw/CSDsXUmJtGpuOiYe68n/reTlCPLtVKNTh0iQHWaWGaqwg/XJSk3d1ifT4=@lists.infradead.org
X-Gm-Message-State: AOJu0YydDhXP4lBqG43fayMnAFF4/rq0BYQDVmQn2He3eFPaXob9c6Pw
	r/jNc0sCDoXMLqo6c82UOGl5q5lIJ557XJwxBcFJJDEsLt224YuZPeH1CAuyOHCiUWrd/p3hfli
	s43Bs5SVvtD2lvJiBKNmO3EQB79ZnI5phrDk0vJH6oEO3d5YSWOfcC5HYykmEVYQUGCoeKleP
X-Gm-Gg: ASbGnctU9RTkLWaP9m4fZexknKu+i/d3rC+lK9I0j+sXl3GGp8oFB40W+wpzZ6eMWg1
	/sw6Uoktf3bH/T7Q/OcJ2OVXlaVx3gqPMhU8ZtSmwE81wEJNTHB5fe7uam/rYBoJl1Gb++M5MjD
	CFOPMzBAQt9dIsTmEipUJ5KlVDTg6v9WXEt4zsZrVk/z8CKFvxFuBFMkYvs3DkMN3hxew/25/QR
	N0DCHz6pJBG1IB4GYsfnNF9ZsEGsvgYfapFXtmQPO8pRAQqHHXo2dKkX1yYGC3Qk6t+OOO3IxKO
	/xaB4PoKfzlogeUIaUQKJk0zTggqJKWHDgTokO2rrgiw60ZOxDZ5Ca4feQvLxM47godMvmItFQu
	oeA6eKiMcvo+jaRn5L1NJ4X0bUxnP94SV+wSRleWoUFApL8w0FA==
X-Received: by 2002:a05:6a00:2e98:b0:77f:4306:d248 with SMTP id d2e1a72fcca58-7a220b1cb4dmr23213055b3a.22.1761105638295;
        Tue, 21 Oct 2025 21:00:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9+ZWgEYuelPUMs8/IMbjqolr/hnJiZreB6vELWwQ/GYSAepBQAwadLK+pr3OtRUJnVF3AqQ==
X-Received: by 2002:a05:6a00:2e98:b0:77f:4306:d248 with SMTP id d2e1a72fcca58-7a220b1cb4dmr23213018b3a.22.1761105637779;
        Tue, 21 Oct 2025 21:00:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.122.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2301108f8sm13116740b3a.66.2025.10.21.21.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:00:37 -0700 (PDT)
Message-ID: <f99a3639-9616-8328-bb49-17c121db5bd7@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 09:30:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath12k: Assert base_lock is held before
 allocating REO update element
Content-Language: en-US
To: Sarika Sharma <sarika.sharma@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX/hijkX5P9S/v
 rzUthiMNCNOSJ0+FV+kpHYRiBlYofiI0bB0fMt5O7RgpJ8A9pYUw9/HYVkqZ27edfq+Mk3yy2lz
 158FGNkezyYObvOf/5J1jNUf4slJvXObQ9PjwHx0iG2XVONl564Y7bBqdzkIJWJXC8GESiffFMN
 MQIdPqCqCnO1F/gjI6bOHTacTjEC9+oZeyC6nlwY9XPlmZym2eZ2bL3WM4lU2D/+ne6AFZSO4IT
 BFOTtKxQMMAefhf+EpOkK6Sk5l5gB/bRxTsu29aq1ua74c18IOcy8jHYkCkErH1DYRcAVLMu5VP
 tyyqfjY6rBRzxrC5OCnzVPfZ6UPSGvpcvmclxALimpdoJTpj/dpq5a3/F6+OQv0ANS5OOpQxE60
 G1ve7/rvUfiVYCNHSluHO5h3cnTR9Q==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f856e8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=MVWiM3nRykcdLg9H6cDE8w==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ynOTO_sPihNLyZ3iqyQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: w7tb_wd66cwW-8AhwYivzsEjN2PLRwXM
X-Proofpoint-ORIG-GUID: w7tb_wd66cwW-8AhwYivzsEjN2PLRwXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_210041_599627_2E53E6F9 
X-CRM114-Status: UNSURE (   8.30  )
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



On 10/21/2025 4:52 PM, Sarika Sharma wrote:
> Add a lockdep assertion to verify that ab->base_lock is held prior to
> allocating a REO update element in ath12k_dp_prepare_reo_update_elem().
> This helps detect potential concurrency issues during development and
> improves code robustness.
> Compiled tested only.
> 
> Signed-off-by: Sarika Sharma <sarika.sharma@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

