Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F3CCF9EE
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 05:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnmIIGRyWDgzpEL4nE9m6+euHmxvL+6pBVybBni9b6M=; b=AizJ0pGhPN+guePRAoIEY7N6mU
	4/IV2M2x/5Q2H28WVd6tgUiUH2YRBAU0UnLu/mbcfdEzhNUPeyST7qA5msj+Bt9Pmwtq89Q9bOVhI
	FLixUvV/gIG0KL0Ap8/5YOsfkE0Wpra3OB7tyfZESiipyoxFGEasNw7qOjXjFye9sbcmz6kAU0D0q
	pAJIBMBLw+ywEd7qu/7dtf7EEe6lRpZb1easlovAmGFxy2QWisFxsueeQZbc8WnwRR6DqhkZprWpz
	qHhpFrmST5FKOqdp2KGME0P1B9ycOf4HZqaWQ/+cBOhjycq5Sccjh8BQVQeM2V6xEzcd10DYi9Q90
	WDFzG0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEhIF-00000005OuV-3awP;
	Fri, 31 Oct 2025 05:03:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEhIC-00000005Ou8-3D99
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 05:03:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V2B6xx102654
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 05:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnmIIGRyWDgzpEL4nE9m6+euHmxvL+6pBVybBni9b6M=; b=a9gxUhAs3++JcMO1
	QBnesSUIbVk25YyNBZ5TApfoJEk8/AU1Xz4ry1wmuyKGbw0I2V4tc0TrWH+c0NA8
	RdOd/ssOOwbKr0cTe9vhZ6l7KY96fmM8LJAoTeJcocghTrbkj3GEE0huuHMJxut1
	A/ZN6euGCMZvj2ZbndPjpB7tDqIw8gyqRqozSpSEq1B+u4v0dGJbIJxvQN14w6um
	ENqQS+/LwGhnb0OLTjNO+PtuqPR+Vl5Vgy0E6o5OSGR8EPRKMOHy4+FBW4M6Pi/B
	oRh4SPEfACquvG9Z0X0Li8719x5b5Qc7LRcAhAuFf2zhLMkGPXkE72a9h7UWSmmj
	vVlK0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdhxaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 05:03:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4110so1341698a12.1
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 22:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761886995; x=1762491795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnmIIGRyWDgzpEL4nE9m6+euHmxvL+6pBVybBni9b6M=;
        b=UsqoNb8jA1sYGrS8bOPrVMsgEnaL7sSi0+3OOTR3euEIlOdaJ/MdDqvbTFee82rWoD
         vRkIZo2jeub+8YQ5DrgI86jHRY/a6iFIws8RKHVcIc7ykPtm0QCNiQfGKsAxqLw3j20N
         qkQdktYaHETBri5NavwEpm0Lc7uHeIZfDKN1lr+Q48kElcMBhWUgv3Do3AQbuOQyMqFL
         EDptkEasoHV8Za4QRZGet3WR/96WuMg+eohLvymX1QsFMn5rKrKhpg3DyjM0ace/WvzI
         jH3H3WS23gIJf8HOtzHfAjLS754nk9kpVjtmqk3ByfOiO/CyJNHEKN2CtO3GlHBRKpJP
         PZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761886995; x=1762491795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnmIIGRyWDgzpEL4nE9m6+euHmxvL+6pBVybBni9b6M=;
        b=vzlUfvCIYaKNOfcFgxknZjmNM2cncKaz17Qw6qCmqaVvXP+sEf6UEDf2HJtPw2+5bg
         gAKyBoU1uLpQtysbMcqzohSCZ8uP8IDEZkeHrIRnaxnulseTf37S7ABlnqp+M+w/Z0Af
         YxMFZII5HmwZa2yK1JcyGkIYhJrsFh+KJ3J+U1prkrru/T63tb/5lr4BnWnS6tEHCiSk
         EILTa8uDWyUJnDV1zuLeulLo5p2q3cMdAzrtEjVfsv3OliHkRq8D7qu33I/7ABXiSvb6
         B0M4TMPmTWmyA3BFaTRtbYR0FCRUDrw8dXkfmAWcX8D42of6pe1Sb6ddlYPRa8/jvaqJ
         T9cg==
X-Forwarded-Encrypted: i=1; AJvYcCVCTooDmWGb+gHSCSVS7xsDnttXfo7b5d3rqzNeRDXZw80+6q6iiHujn8mbKmwY7CaXLMv7z1k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA590C3Pjn+PDt9uhj9LGWWE3820SGybQeCMSjmbkfYcSKgz5q
	pbwkSPg5hBEppLLq4awUGHF5PpPUM9QsBeT1mSwCDS+Vf6X4MTrmC2oIWldtlyUA/fexWz8W4Ic
	Q6iAx+gqF851kWUqz1N4w7WHhR02dH1p+4VQQDN/LOReCMmVWr4J2RpIul1Ob517g
X-Gm-Gg: ASbGncsiECPI5gBxP2hQ2sQMyzYgMv4JpH1eToHTWXFkWRID04/ZQxH9GxBsqxkpSd8
	ST+yAPtKbKJAUylaLi0ANQBRDN/HhYQy8nSWQSd3s5MmjyXw/B1dj1kKEKZfC/H2yiXz3E13RLi
	/zOpQAP/vg+C1bCvG2pxdhf/Cm/9CVotdqSrbpFyqwemoPF8KrI8R4RuWO3olJPDJli/O9CmqjI
	D9/xL8oCKYLs9AeSCA8RsucdV5r0utjbnYxqCngykE/WhfC1Ypc4NqKIPoElLMUV1IbYJoHEU6k
	dHKQRcJpL0xTTBq7QCKXLByK5dCAxR0jVfYs4vn9njPbWFPy6C8jbAvmQxNjvaFtzfVjPMC/V0f
	xGx/Mjh3OUF0K7o3HEFksJgjZMCYS/qe/HLCDG8Hq+T7zRCl2IgvI95QCxSCZCoJj06Y3F/c=
X-Received: by 2002:a05:6a20:734c:b0:340:6b3e:5611 with SMTP id adf61e73a8af0-3477a5c12admr9772188637.6.1761886995202;
        Thu, 30 Oct 2025 22:03:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEevVdIiUdoYC7SFpyz3u2jiAoKNuX9JBljSICU+CMAR68uvct3zUzNMA/8ltjmJYkYlUI4Pg==
X-Received: by 2002:a05:6a20:734c:b0:340:6b3e:5611 with SMTP id adf61e73a8af0-3477a5c12admr9772146637.6.1761886994730;
        Thu, 30 Oct 2025 22:03:14 -0700 (PDT)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bd9616c9sm672853a12.23.2025.10.30.22.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 22:03:14 -0700 (PDT)
Message-ID: <c1304269-7826-4381-ad18-28ad40f79625@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 13:03:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Address issues during beacon
 stats retrieval
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA0NCBTYWx0ZWRfX7balEfY59mLG
 nmqhtxmv+B+DL/4Fv86OwdU/WhZeZ7rLjdyq2g9jwYF88lk12LBSN0Onru0PqRqvcdFySlYpOLw
 BOaZhFqmtYFlIMBYIe9lTv2TiHalNvX4Ll9qFmDR553qEK9K9MwVyWIQLRV2l01sUL1voQUeldl
 OZs0UOZgq55fTplxG3v2R0rHjOocvPJ6F1KXnDCu8OH3qZpcehY9mi/kVSpvkeJVpdfD4arQZ9R
 3Yu8fe3ZG9nb2PoWseDxbtaSERK86Vn7GZ1hwaLMEkasNC8YfPpiQwkZIDQ8sJlg+W9n93/MI9P
 xtXduZxDZ/xx7atx0j6AjAZjmYORaaHN+HDOeFquYVao+MibR7H3dUcC5vWQirg+0mUMaeiZFi3
 dIY5e65ush6G1owZvXuW8S4rRvamag==
X-Proofpoint-GUID: VdR2WADG_kLbEBacIQSm2V_ClQLh9OtU
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=69044314 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RNRu0hrWFMVXu-6-hGoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VdR2WADG_kLbEBacIQSm2V_ClQLh9OtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_220316_944908_66111BAB 
X-CRM114-Status: GOOD (  11.59  )
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



On 10/31/2025 11:07 AM, Manish Dharanenthiran wrote:
> Currently, retrieving beacon stats is getting failed with timed out error
> when multiple BSSes are enabled. This patch series tries to address the
> mentioned issue by the following,
> 
> #1: Reset the firmware stats only after retrieving the complete stats
>  #2: Remove the wait timeout to get stats for all enabled BSSes during
>  beacon stats retrieval.
> 
> ---
> Manish Dharanenthiran (2):
>       wifi: ath12k: Make firmware stats reset caller-driven
>       wifi: ath12k: Fix timeout error during beacon stats retrieval
> 
>  drivers/net/wireless/ath/ath12k/core.c    |  2 --
>  drivers/net/wireless/ath/ath12k/core.h    |  1 -
>  drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
>  drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
>  drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
>  5 files changed, 14 insertions(+), 25 deletions(-)
> ---
> base-commit: 197498315de711140bcc4722fdeb7c1761777100
> change-id: 20251027-beacon_stats-5a84c15437ed
> 
> 
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


