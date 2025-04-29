Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E27FC369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzATX6zxhYJia28pC2CarcpW6OO4zSyxT+uOihKZvr0=; b=I2ruGwgDDfg4gjrUaruXEQOPoH
	WyzBe+AapowI6MwLvUKrPghhDl/yV+5Wqo8IT0Xc2KPb1iNtQdqrCdNfQacos4kKu4W60Y6KFJTk0
	AIyvfXce7d7ozjB2D11TaZ3crVuxBhcfkvlzAl14lCR7WfHdSv3+MKCSPS6gbqIS1ZCagroywtyte
	+QRsD1kmsm5DfT+p64RlP2iRLNd/AauARI3OQX2tcjm3Ay73wHoedFQ8XKv7snma9UE0dO73uwz2/
	b+FXBlQkHbQQIXipNE0Fq/CjMjNgpY9No9ITpLJ4l2NFFmATrI6VRCgeGWru8ahgvLsDJTdPIeCRw
	W5otTvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dPO-00000008N6Z-04w2;
	Tue, 29 Apr 2025 05:21:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dPL-00000008N66-2qi1
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 05:21:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3ms011884
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzATX6zxhYJia28pC2CarcpW6OO4zSyxT+uOihKZvr0=; b=LGA86+EIPoIfhHXS
	ya1ESK+5iZzjnZ7N2dOVnBD4o61r0DuBIUAdT+Mrtp5556CDHq8xjRfZAi8R60U3
	TjTT2Q+3y3xmaccf14GpqIjWvVhkgx51prNjuqS9tGiZsDCQMEzwmJbjKlcKb5QJ
	ACbTMenmMZpKVOBOp2X67jM390ONMC3ZHKIQ6wAtXzgaoCpBOAhE9Gud7wZGioJk
	Wbk5JkEuEI5DarVQfB+WtGNbmapKo98H+8w3FsC8pW7i4nqAsWQYG+LxgChoQPm8
	7K472OhnFHGSwDhDBVcI2t+J2GOx2n8hEwiuKv0oCcPoAS+FQz8Spn1zJuwqNl0o
	Ln4S5w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q3239km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 05:21:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736abba8c5cso6684702b3a.2
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 22:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904085; x=1746508885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzATX6zxhYJia28pC2CarcpW6OO4zSyxT+uOihKZvr0=;
        b=GyLg/XeIdBz2MjUB+DBUA/VB1EAJrchOUyh1QIMJqyvJ+vlhkXmTtYccssCISNe2vH
         YVxEPImPs0sd4EOlO0GOMFbQyE0U9ck3TqG95fnUJ78v7CHvtfKPrO1uE1JCGuEhZXJq
         8CjrBmcc93AS0nSPnowNGxglVE0QX9KKvAS+41irxovRqFcGRaiP7i7jYnx9YxD7O6IJ
         XLLQ/kv2bDY34DTLzDeVuw5EuAuF/lf1bvuECvJbvUQAX+Ovl6JPgnGYaV4v2nLiqVrA
         WfO4QX7wwq/iGx4xuMN7Nm8f1QnVcfMOqHPBQp1OZ8LNM/wEwz1b1AkR2gYiT4YS1L5g
         CXRg==
X-Forwarded-Encrypted: i=1; AJvYcCVKFmqtvFaNtjMvUEiFkT9jnS7gzqxsjnIiFPC65yLX+moXzw/XHzG1/iqTHrMCFffNs4e8WiU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoxzIEo99XwQDUZrg8v1cnDGf97Xzty2oMmMZy1y20A3bheIFC
	uGCSPlY27xeJW//4eH3AJW1dHiodKQCiAooKgTgtKyWuJtiKeRyEK0vPCJtZL+a0nrglVUVoqzA
	Jx/0+Ek4udtauLvjcP6dERfIuZgUjetLoEldzwa5r0GvfSV2K5LZRne18W20s
X-Gm-Gg: ASbGncv/MhyYAqVKHT6JkNs8ddcRnHtiRSs8/P7yUcZAs7ZUs1ubir08RF06UstU2uB
	nJES+oS6vpzii/4M/JioCt8MVXxa/nVDK4rnlLwJamvygvpKDVOHQrbqTNrflVt/D5OvY8xC01Y
	8+JfO6/P4GOuIOlNe2jnKsb8/NWdc4bOs0mGe4HMJfLWQCybrGbYttlnWzmQKFJL2ehNQ6Wp65h
	7jFiqafsosIH1UfYpXFr4SmV7eaBMmsMl67LHZuAc/0VA4ohqmidn+EYCxGkLpYFcdDyHVZ/sVh
	8VIxlz3czV3FHj4N4/vEJR1LVlHjXBdcFBtDh60FJZigFaQxBk76hA==
X-Received: by 2002:a05:6a00:1383:b0:73f:eeb:84bb with SMTP id d2e1a72fcca58-740271dec45mr3673304b3a.19.1745904085252;
        Mon, 28 Apr 2025 22:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3KMrIHoIFeZNETaFU8v9QkPiKuy+plcJdaRstmwKz3TkdKekqZHPWJ8ksxvfGeszqhm4xTA==
X-Received: by 2002:a05:6a00:1383:b0:73f:eeb:84bb with SMTP id d2e1a72fcca58-740271dec45mr3673281b3a.19.1745904084857;
        Mon, 28 Apr 2025 22:21:24 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a171sm8988485b3a.87.2025.04.28.22.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 22:21:24 -0700 (PDT)
Message-ID: <44c0415b-b5a9-2e29-6dfb-158ff9e14308@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:51:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH wireless-next v5 4/4] wifi: ath12k: update EMLSR
 capabilities of ML Station
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, johannes@sipsolutions.net,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
 <20250327051320.3253783-5-quic_ramess@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250327051320.3253783-5-quic_ramess@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681061d6 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=sqzE39mHLPIEPpc8iXcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 60X90z4HYyuz5bGr3QrpXhiAOMKnp1pT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOCBTYWx0ZWRfX/4bztKKh2i+1 MWiRYjHXazITzSojCW+O2nwf9SEUc+jjp9Sm3NS3bI2/mqifdODko8MvDgVFfBwecZEAT8jM3IR UjMtBBq5svBdYZZddpwFIsBRvRBmVnrzraLFSlytMF5d/Ojdy8tWg8okDQxovFgXivKtnlMERbp
 fptYDq++G3nLA6w8E+se+B7RqrplQYXTf586h8HvMdnOXHKWJwrJJbAfl0ZCk5dacltyT5AX3PK fK5GIoQ0I+jeGTodHB2f0MKU3122PB7UgZGBKdpvHDjp2kx7F/wp7kUxQcEySlEyjgxxJreVhvm n6h4RO8zWrobmmXDSo9JiU0smZXnUl9iC5ElNz4KLF9hUd3fWLugWxxCKHooQYybs9xQrt8qe33
 bQhtY4N3KLFioMDq7FN61d8sjFLBO3356GqsdT8Iqo8h1VQBPEgMmRQJjcE12SsD+4CyO+WP
X-Proofpoint-ORIG-GUID: 60X90z4HYyuz5bGr3QrpXhiAOMKnp1pT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_222127_849109_75324A80 
X-CRM114-Status: GOOD (  12.01  )
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



On 3/27/2025 10:43 AM, Rameshkumar Sundaram wrote:
> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> 
> When EMLSR operation is enabled for an ML Station, EMLSR transition
> timeout, padding delay and transition delay should be updated to
> Firmware. Above parameters will be used by Firmware to do EMLSR operation
> such as sending EML operation mode notification frame, initial control
> frame etc.
> Obtain above parameters from EML capabilities information present in
> ieee80211_sta object and update the same to Firmware in peer assoc WMI
> command sent for ML station.
> MLO is not enabled in WCN7850 and hence this change is not applicable to
> it as of now. This can be a leverage once it is enabled in future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

