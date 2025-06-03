Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD9C5AE59
	for <ath12k@archiver.kernel.org>; Tue,  3 Jun 2025 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZgFxUUH1qzOZLDH/W0RuvDMG333L7//fcnO2XCla+8=; b=MDD07TPCYEG9p+XB6ovrDjj8od
	A0XXbeEBoPGUBD1tllvh74Ncq/qp0iGws+PKxes/QySQ7N3GM9t3Ew46xcvhBvhEO/2mnK69aLF0B
	qKrmUGpe6kkdNAKhgNicjMccmUlLXW2tOgsqOArNgPXhS1gI0Q7sMfkhs8hTKjuZBsezqHxKE/nDO
	QhzQtMNKjd8VN3N30q+I6TDckOWv0KZboL2qgnALSqTNGxZ7z9RJIFF3L6NgsNHoxiCw9nq2ZbV3H
	1Y8dFcsYqsTzpJ4UJn+wjJ8ckRLdzJ3DS2jVcbTRQ2wVOnHgdRZJtBoz9uIu9uFPkHhPEm6gRlWu+
	8a9NNEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO9V-0000000AZJa-3LPY;
	Tue, 03 Jun 2025 09:41:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMO94-0000000AZCE-0ut2
	for ath12k@lists.infradead.org;
	Tue, 03 Jun 2025 09:41:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539KTMu002521
	for <ath12k@lists.infradead.org>; Tue, 3 Jun 2025 09:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZgFxUUH1qzOZLDH/W0RuvDMG333L7//fcnO2XCla+8=; b=Q1swABAK/2ZNP0Q8
	/nuDkvmVfVLlVLWps8geL7fOvX/MENbAixSJPB7igYd22p4juByHEgeVwf5V99fA
	9oHqUNM6ACNrXQn5KRIHMgVYcL4QGhyqbUTQVc5OBgPOSy4XuN7BmmIovg7q8FGg
	t7IVMjSy51dEEbpXN1zmCB/yMH8zx4GEv9X8ypJ6dixIaueX7TmxVWZxr4iSrk1M
	OBpEG6TqM70dhEsKUgdFRO8HlhA/4l+CvndBiwBdQQbTrIFXf+gPPpBEWD5eX8sJ
	33ixZOBR6uF+vVOLxXCO/JSA1RZEIDX7QDnpMDt3ba6EmCvJoKr8IL4agllJsoMs
	gsYKFA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta41d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Jun 2025 09:41:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4062845b3a.3
        for <ath12k@lists.infradead.org>; Tue, 03 Jun 2025 02:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748943679; x=1749548479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZgFxUUH1qzOZLDH/W0RuvDMG333L7//fcnO2XCla+8=;
        b=sQY4gLtYCxMv+WyfeLM2XxPpbujGcdGdkxxcJJuq1x7na3sU5q2maBR035wYmT/Gzm
         XY4Si/jjwbuEze9FJml5yd+dP8nwuP6ZRqw7Vgu0o5a0RJBFvKMRwtL7vB7l/W3ZQ5fe
         bC7MPu95iBMi3aVEJDT97BKEzQdjFpcbArj5yZZWibs2JzK8i1HzE7sl5VstdaaEL7IV
         vpLbshfheKYOBdp4deA61ZQ6nxlc77q7/SZcsElrkyV8pzFRLOPIF9+FTLIakQKM2y+b
         EWmI523OyXHYLZaq3Ikis7zPF/xNdIggRZhb++bDPjJNPOtg2bN6aCk4xtIf43sZKXvL
         8aGA==
X-Forwarded-Encrypted: i=1; AJvYcCXezLqMTg8s/xw2YN+FjEbx1tIaFAZSmQUYOYpavl9D+8mfrIMTMPYrGMHY/CTVYhU+SYJaUOQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YywGXJcVj2eHy9yMQcA+unACYANCWMl22C/b47D5GVX/gF2wFIx
	fS8l3sGRkxQbWTIgDsoxL6wWZZLXZScGkOEwFa9h48JwqeXDcQYfCCSiJClODxlDLDMyTdTsjBF
	SXSN0uNxdibNXZihXVpva1qN20BgAx8lV/BZt85aSF3aeu8wzuLP+LysQun6DQ/ZE
X-Gm-Gg: ASbGnctTKC90cMwpXiqT5VdtHXbtry41LOGUaqYKfhZsfq5WjdA5CO83EDdp3U8qa0i
	Dnm9CGnDj9XA4zkXY7lMgqa4Z1mRhfvTqe4/k6AnndfjNe55Y67AwJ8Z2QpMgg8X6oGlostAiNg
	OfmRBEk+FgXaSguuRANZsuANQ/YTTyxbUBZkuLcdoERoZZMuv0MYgjV5N+g6JWtGz35ZgJG7j9q
	0QoP+CRBITmXRWu8l8xoPIU/NtmMUuV9YWzP7Q7dyb2IR/5sw8WxXJdzNfr4k5KTTHl//OknTD/
	JENNm2TX9h4qm7g/M/cHZf9wowi90ixNopQO/OxPvLM2Lcp66VBrEw==
X-Received: by 2002:a05:6a00:218c:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-747d1ab07b7mr16015854b3a.20.1748943679655;
        Tue, 03 Jun 2025 02:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtJm0q9o9BMa2e0j0DqdXOZ+URVaEthN/FLWSl6c+aw1P36W3g4vD7j6XelFjFJRDKdtp/MQ==
X-Received: by 2002:a05:6a00:218c:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-747d1ab07b7mr16015833b3a.20.1748943679234;
        Tue, 03 Jun 2025 02:41:19 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb3efesm6767985a12.68.2025.06.03.02.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:41:18 -0700 (PDT)
Message-ID: <81a19e4f-525b-17d6-86e1-774d3132e610@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 15:11:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: handle link select and
 inactivate
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MyBTYWx0ZWRfX90N143o6zJ+6
 WBpX22qq+dCdX8EtZggPA+w7SxmGVeLb3MF/DiQYbfeRo2H+HpxhiG+oOfAzw1gCHDMAAcwQWus
 dYR1y+ZGspxE2FCHCNlXXnqOiucSe21Eto3VH0uwzToKxASYn+u+WxeVtW+qMpkehJyJefz6t9u
 H2PVDpZ3kAWeK7X6ICxhgqTDPp+vjzIGFGnmLYO0bFCj1WI1hSeuc4EluORifI6TW5e5/tmmA+b
 Bp75zj3UxKR5UoRvI9u8BQRuzOEZV3SR9Btx0DA0IXbk7BQWdUALcWiTQqDM4yXapPV8/4Xqp9s
 pv2W5x39uGfj8kyXsHsFEBIcZelcWKV3qorszhywyoGEO3I1nX5DTz98lT81lBjpo3FROyLyFLb
 JvDrFWIYNsjmWa9y1hhuIRYPwTTe6Ue1SLWOZfzy+27dH/tsCnS9z0xrvcFukUSbZWw0Q2B2
X-Proofpoint-ORIG-GUID: 89-uBE8rxoaxoQNOEwOSb8fX2mZFyl9k
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683ec340 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rSFznLUdu7_CRTz4a9oA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 89-uBE8rxoaxoQNOEwOSb8fX2mZFyl9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_024122_388823_4B19472B 
X-CRM114-Status: GOOD (  20.15  )
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



On 5/22/2025 2:24 PM, Baochen Qiang wrote:
> Currently host activate all useful links:
> 
> 	ieee80211_set_active_links(vif, ieee80211_vif_usable_links(vif))
> 
> this leads to 2 issues:
> 
> 1#: If 2 links are created/activated on the same device, and both channels
> used by them fall on the same hardware MAC, throughput would be lower
> compared with even one link due to MAC switching between them.
> 
> 2#: If there are more than 2 useful links, WCN7850 firmware crashes when
> host tries to bringup the 3rd link, because firmware supports at most 2
> links for a ML connection.
> 
> To address the first issue, host needs to send
> WMI_MLO_LINK_SET_ACTIVE_CMDID command to firmware such that firmware can
> deactivate one of the links. This is done in patches 4 and 5.
> 
> To address the second issue, host needs to make decision to select 2
> links out of the useful links to activate. This is done in patch 6.
> 
> The link select and inactivate are both based on the knowledge of hardware
> modes, which are advertised by firmware in WMI_SERVICE_READY_EXT_EVENTID
> and WMI_SERVICE_READY_EXT2_EVENTID events. Such preparation work is done
> in the first three patches.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> Baochen Qiang (6):
>        wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
>        wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
>        wifi: ath12k: update freq range for each hardware mode
>        wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
>        wifi: ath12k: update link active in case two links fall on the same MAC
>        wifi: ath12k: don't activate more links than firmware supports
> 
>   drivers/net/wireless/ath/ath12k/core.h |   6 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 364 +++++++++++++++-
>   drivers/net/wireless/ath/ath12k/mac.h  |   2 +
>   drivers/net/wireless/ath/ath12k/wmi.c  | 759 ++++++++++++++++++++++++++++++++-
>   drivers/net/wireless/ath/ath12k/wmi.h  | 180 +++++++-
>   5 files changed, 1305 insertions(+), 6 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

