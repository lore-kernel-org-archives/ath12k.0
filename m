Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AD0CAC5B9
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 05:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1EPOK+3bFP/HMQmgol3DnPm/OIDlHf1/L95rTswwE4=; b=wmRBAfeEmDklkn5fl0+VPUKgym
	oQaA2vb/7F915l6MOSVbdFQxrAn5ONigPahnmHBduppnphcSlVxwqjMhn4j5YP5FYpcDQiqk3qMfM
	jFE9Q4CWWH3F5G6eh0J1ZNst1PoUPldcE73aHj6Rqf583To6OPtsYZ/cOkmWz7KFocHIrXc5ZGU5y
	yeMfDYSbm+lJUp77jvit+0S8/pUf1ezgUz3HNC6TAGfh7D/TJxSqc4+J2NbsGdRKAHnf0qep4i/NJ
	HeuN9eig8P0N7kN7wKTKAdJXEEP1lLkqNYG9Rm2AsXsZ5MyJrnZKb9sLRKsmeHJuomjyZCCwYRB7K
	XJyLnnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3T6V-00000004GWV-38UX;
	Tue, 30 Sep 2025 05:40:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3T6S-00000004GVv-3RmV
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 05:40:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HagP017597
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 05:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1EPOK+3bFP/HMQmgol3DnPm/OIDlHf1/L95rTswwE4=; b=j3xoW1RLc8IUOJz2
	TS1eGY/XDWeNdoTohAGiHPBxf1jwntvP4rnEmWpNy/orutBZS1vJAk/nkOlE3Kve
	xPy4y0+H68HjOHYv+YJaWvMNlhjkdRf7sY7aSx8Mw5ISTxr6P7GxKsHIP6r/lQw7
	x7+pm8IQua4TUfI2ph8CDAbUHKiP6ra4QoprJIdYLoxwlvff6+VKf7lxgR0Pulgx
	odOYlQJWrNNIQH6ADD9ybip28U8pAAmv9jtxuNryk6fprQNoUfovYlVCwbjdgJrk
	5I0xuqUbWUQaVlXXBXuQiYR9KFY1AunajgBG+P7+LMcnkvlnLzOaaUuXvvvFAtuT
	y0d9Jg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tquwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 05:40:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-334b0876195so5615571a91.1
        for <ath12k@lists.infradead.org>; Mon, 29 Sep 2025 22:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759210841; x=1759815641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1EPOK+3bFP/HMQmgol3DnPm/OIDlHf1/L95rTswwE4=;
        b=hKyeZb7kCrMmNw0mYF3hQIyKeL57N2fYTQYVbzGzuMEuMk7whxBGmse01GJKymZBR9
         dDyNecXwmLZ2YZ94PkS31DeGse7lMvfCEXB2CcJakQqc/0blA2m09y/jzz7N7gnMiYR3
         r4YMTbMM6PM2CrVIDqW6ZzFB19z4tRPwL/lt+FLRcY+ATRGNCePFfbZWb4SrMGGYLL04
         HPO0VegNE9ZV3gRLQ3TA0ls4smKj/PXYSepDb1kf0Z4FVDK1mJwIHtQKdmvYgWOyAx23
         V7qUw820C85wSYg9YK2QblnPZv4EKrTMSVfbwcD7ycpjDR8TsOhIYooZ0IeVmVYFj7Nl
         KRVA==
X-Forwarded-Encrypted: i=1; AJvYcCXjDX8MVdXfPbfdzlil6zw27TVo9w9XJMvvRIuriesk3DDoxVJ4i03OopDoIzySalfQAf2Rr4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfRzT6dchlCLf/pDPNeuukyQZjo0e0AIjt8q9tJtpDvk7dcw4/
	ELPWECp8iS/Mqs4jWRqzsMYMt/cq34V8oJNO9UvAMGexsk+VHL23I4eWuGs/AIn/pJ/Rsp48C1p
	qe2Ie0HKsa8ULd9WFsWEbRCj80f3RMmSM2igcvyVXa3wf+cpXWWx3OqeNT2aP4tZkpg9IG6+X
X-Gm-Gg: ASbGncsmDqyfx+iysaydnANKnYYkE/eERiJ20iGfki+EPiRw6ugE/tjiVR3YO5M9Wid
	3Gl7kl5FrhU8JDEooa4azyDGtYu2EtSRoEvx5g3oNGdVkxa/Xp4gIYq4vdSW0KKIEbDEyuKkd/X
	OSx+54b6oupQv4HwQdcHOoIuMkGy3M1GM9bzY6Zy778j27RU42rsw40bcwBbl4KzT1qJ+IaryOQ
	vxNCpZm81LkFx0kb+Q5sTQzZwrJE6Bze6B3By8ov7XIzpVkZ8VRlsW0h8EMNx3repXAjpSAitzx
	gNOnhqpcLZspJpKdxIhsV2Rmcyx8d3JTZimrkMeR8DWFr7AmC0D0FEEQX5Yilc1vRyKnx4joESG
	MmmT9yvi883TSigisazs3l5JxiNr6cssX5ij4gcjQ9n8+SKlV9MTaER4Z
X-Received: by 2002:a17:90b:2251:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-336bfcfc8ffmr10828738a91.20.1759210841345;
        Mon, 29 Sep 2025 22:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWxFBfTEKrIu8D1dS8faGAi2Yui2Vgj7TW2JiI96lhPN3TSBio9xS5GJ/b/yp9t81jQPbqvw==
X-Received: by 2002:a17:90b:2251:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-336bfcfc8ffmr10828705a91.20.1759210840886;
        Mon, 29 Sep 2025 22:40:40 -0700 (PDT)
Received: from ?IPV6:2409:4072:aeb9:bda4:e475:f0c2:aa83:529e? ([2409:4072:aeb9:bda4:e475:f0c2:aa83:529e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb255sm12995938a12.5.2025.09.29.22.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 22:40:40 -0700 (PDT)
Message-ID: <7ba48dd1-5570-275d-a360-ed3231fcac6d@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:10:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: free skb during idr cleanup
 callback
Content-Language: en-US
To: Muna Sinada <muna.sinada@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
References: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX0jDAbfTLOHQ5
 0+XyUkionC1ILID3vuiLFPD7Rcvqr/rMANjrJ9GbOUlp2kE6MJFk0PZvuxEgOqB3xUrDtMkFbo4
 He5W5exP2IXvatr6lCB0t4mBBn3IpNMDlBsA/D5ydzJXlOkRNXwMMjPSWGAPrGS9YMuoZn/c7tF
 Pza6oMwNQQzJw5Ok2XSu/G2nNTed1mKu6dLAoLlBEHzuktEse+CvLCRMrsCmcQKoOrL70Y15IqO
 2MlgR3AuG2U+2Rx3FHoN8KPTJ+VsYd+vSsGfH3SdNaoChod0R/8wpRRZQCN4wg+kd8y9U7586oC
 qiyF2O7v7hhc6ZI2Io4tYWdyT8LkndVl1dSQba/fUXw90B9/BVkqaBuIVFV/TnUDZs7CYQsamMg
 yGaz5QK5HzTfFX0OfEXzxuirN4R7Og==
X-Proofpoint-GUID: 5gw7WALLTHhmUefEwV-GaCv3VxyI6YL3
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db6d5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=c0CFwetPJ_w4sTF4psgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5gw7WALLTHhmUefEwV-GaCv3VxyI6YL3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_224044_984795_2CAB30B7 
X-CRM114-Status: GOOD (  11.93  )
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



On 9/24/2025 3:33 AM, Muna Sinada wrote:
> From: Karthik M <quic_karm@quicinc.com>
> 
> ath12k just like ath11k [1] did not handle skb cleanup during idr
> cleanup callback. Both ath12k_mac_vif_txmgmt_idr_remove() and
> ath12k_mac_tx_mgmt_pending_free() performed idr cleanup and DMA
> unmapping for skb but only ath12k_mac_tx_mgmt_pending_free() freed
> skb. As a result, during vdev deletion a memory leak occurs.
> 
> Refactor all clean up steps into a new function. New function
> ath12k_mac_tx_mgmt_free() creates a centralized area where idr
> cleanup, DMA unmapping for skb and freeing skb is performed. Utilize
> skb pointer given by idr_remove(), instead of passed as a function
> argument because IDR will be protected by locking. This will prevent
> concurrent modification of the same IDR.
> 
> Now ath12k_mac_tx_mgmt_pending_free() and
> ath12k_mac_vif_txmgmt_idr_remove() call ath12k_mac_tx_mgmt_free().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Link: https://lore.kernel.org/r/1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com > # [1]
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

