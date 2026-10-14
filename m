Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A58CC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjDHRrp9q62Vy4VXfnTEgQ6XbZ2XuesWLJKlYoTd67s=; b=o89CbWyyr+uu5A+699Ty+Q7lyw
	DmfkWbDz4uNdMBJpirfEW4NauAgSeyZlbUXYwoVZ0av5Y9sr17In1dfmihfhUgWS9vcxwiskFRxW4
	5mjnQ0LRnsBWDJFmI22mhQSBVHBgHJ6XgQ0lM7pBUPTsDD4ksBCXW/1ExccRDhyBfLSKOXphjC+Tx
	5FtH96ED3z0JB/j7gGb7pPJI8IJ+qsL5oYBm6n658nOnslo5i4Yaa7eB/K3DTPJoxBhQkymkdhrNc
	9K+Jq+xT8+TadaxAOVT4ANKaDOLtoS+7KYcYZeFwDXUa/87N7lHODch87yH7AFlHvrXDGEDXf7lhH
	kh255o9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvlG-0000000F99k-0Yj6;
	Wed, 14 Oct 2026 09:59:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvlE-0000000F998-0iJu
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gjDHRrp9q62Vy4VXfnTEgQ6XbZ2XuesWLJKlYoTd67s=; b=KmJQqXzynRMIzIK1FKLtpU8xYJ
	Zwl1kaGoiK1N0yHQCZnu6Pulyf8kKKrnhBncTbgjnckAEiUw/VJlc8BWnxvg2HfX5FlcXwhNoDx2z
	Sn19cEf/q/J4jK+IXBx79VO9lQUVLcGAFOMcn3YwxdzdEcdXk/sk5k1nFnK1u2yWo6l5aorVC1h17
	4Al16qgGP5+B34vh/Zf7dhNH7R5PilWVAYQ00vt68czh1b8jzuQsxl2jWzsgibQVz3mG7+7PxY6l1
	q3TOPoifDMXzwvV67DoP2EZiswSpW0yaVUhwQZj0qA5dHmP4jkiR3BnADDkMbXKWUwL707QSQ/+9R
	OHntGOcQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvlA-0000000GbkP-3vtA
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 09:58:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5woV83951265
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjDHRrp9q62Vy4VXfnTEgQ6XbZ2XuesWLJKlYoTd67s=; b=MEZ6VAT/ykMVDVpE
	ETSPRg9nAYpyajiw8MY6CLk361BFb7eQqH9LYKM7ZEOjjCD3QHx13m722SDvQJsG
	dtURp7A/mhLmV1z/57hoyBJKxJTFGJE/G0e/GjVeBzQJqQvIhTol2QgdXn06pwH1
	y+SMwYtFBcl+wwHy331VrUWLcVcV6spO0wa9OZceuQ7Lq160K8wHZoChBcxxmuvD
	W9oH7MESPbAYxP4c+gxrdRfi7RdLotPNoF0+qJ7M9sZEBzjN+EDVof3Zx7UFVqmz
	OxXsqliOce02St55VTAiTlS0ECtapqw2B6uiDChnn7WaRgWDjER7F3ndvX3rrlft
	dBKU9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p10ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 09:58:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac50dc68adso1156285a91.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791971932; x=1792576732; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjDHRrp9q62Vy4VXfnTEgQ6XbZ2XuesWLJKlYoTd67s=;
        b=XBU6aFh4hb2/FnwxFi7BGAggXkPReecD+6HOjOGLEqC+cqZEQwQkQTiG0MMtkHc9ne
         lRTW4x7U/qhocKhfVU3yyFTwiJzqxNJxUocQehMO+3qjC1kqp2OIZGVNgyP3Ezcn5oSd
         QB3scWxjeQpvVIXl6NoUdCm93BCYeGB7nXBPaMEgnxsJDXVDiM8q9U98ag/hoO9jrBR2
         kIK5c8+gI69KOGsOJpsNrrQslXpSTDmpGBeZZD+znBVZKTvFckbHYmqh+YL1N4A3NnO9
         ekXEVUhRsHolE08GB+PGq+51EuLU6A+suQH5/asZ2Q21+XnQFTaFi0lTluLu65sQFQY0
         AFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971932; x=1792576732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjDHRrp9q62Vy4VXfnTEgQ6XbZ2XuesWLJKlYoTd67s=;
        b=Ryb5SXVsIYE0Q47dv6np62aR0kWJhzCYVagx4/WE2zLO322nKV5vAgvYRXSR5deiWb
         ZhDUgPbi3N8z7rV851g8Tm3Hf3YrVxxeidJCyn8VYzoHOcIH0YNlBpR+RpL9fZjFySaP
         5FBaYWCswDeHgesbPxXIOeJIEEIJi9BYLvd9nbxc3SqIC9sfy98iQUAMzIeWTFrBYlaY
         mneuvCnw+oKI7x7w2DpQhx1sZ7PkKqr+wrC4uMnwwIOmYt+XHeARknxmNKbqRd8LmvRc
         LMbPET16uJnYKekRPvNz4qnRLVwggq1qtM5gYpMI9qUjqwG/IKQHyHWx6xyXysu/bHma
         iRIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtrsxhrzYfTc8a+5RGDY8MYJ0TTGIrT2n1uw/KcsbdZGJqRJRlbQvPNj46lSiNDZe3YC3E32U=@lists.infradead.org
X-Gm-Message-State: AFq9FYKwP5morIzTIeTLN6cT4sjT8pouJp7k9FJSKKYgCrVCnqqCBxu4
	k4nskll0OQS6opfjzSp4wXH8aW5DDYA4v9kJbTVUah93heCYrbivh4M+cEZ+SG3KYMLn2VZslI/
	s9bg8HabmwCz4aXBEf7iTGlLCyqVQDazIgo52oYUYjjf7tSL/yJjIzkkCW5aPZBVq
X-Gm-Gg: AYBFou0uBcY5qArlbl2WRovc13YLnWqRIV/O7DeQqNhW89wDGGez5eLAOioKAkpQVBV
	eeDlNXzX9RhwKmMb2boNU1LzdtmT4MjEs9ZyjkYSnjPgAiJW9kswwA6Fp9JsXy0pUSeZt4Pp2Tx
	qf1yMRr6NPNBPAeKgvXU218JKBQ2L+ZVbQkq9mcMyUXn5IhC19lDEQkzPHFY46jEdlfPnntaO/h
	Wu2jwVESJ8eBdf2gDkUbEBZOfD3nWPCnb/bQcDoNXYD0lsPgZCfl2eXQPG/m7BOKrvWmYu85IAL
	aCa8IKrVuZZgo33eLzJNkIzONf3c85OFcd9rEChvuxq8QPP46StdwaejtqrewtPK/hxjnBfu/mb
	Gm672ODj3L9BcacAESB/Unus2BWNCl4XNijIVlzidzyrZSns=
X-Received: by 2002:a17:90b:2e4e:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3ab3ac9c833mr11979334a91.24.1791971932334;
        Wed, 14 Oct 2026 02:58:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4e:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3ab3ac9c833mr11979319a91.24.1791971931856;
        Wed, 14 Oct 2026 02:58:51 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5ee3093bsm5225244a91.0.2026.10.14.02.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:58:51 -0700 (PDT)
Message-ID: <876187a5-f8e9-4c0c-8b20-2809a1441514@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:28:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix decap of MSDUs spanning
 multiple RX buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX+6MUT60r+jVx
 yE75jcymMeutr/AoD4VmdAgT67D6rNkJksEmZ7yhWzxGwJTUNfPUXPS+1DCtxOJV1QD9174Oxl2
 uea+so5WGPAbrp02MOsaIcBDlZCyTZM=
X-Proofpoint-ORIG-GUID: CQovMlabTM_aH_DKqHlozEZYcKiK-P_y
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf525d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Awmu5xbjiVYryZGjqygA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfXzJ5pmHAZhqHv
 KuOeZvBmkBtJtKxkBahZ/tL4ZJs/JPc2SgJmBbS82VxjzIhmv2xxvCcmQTqdICHwh6WG9oL27Re
 gc1UKffsU+oOWLA77q1E/W+eUgaI7j2wHgeO7sQrmeI6rhlbyY4rE+0sp5d2Ov3XzRt+Yll7Bzc
 OfrxK1Pp4+X72A1gprjOqAnD4AD4qN3iBCb2s3lAAMDYebu3qrRa10zNth/oLjeDyfdbNjwUv3e
 SIH7vcunAF4UpN1xX4enikwtsnNtuuG+ytA5LjbMtGGBeBzyupizAo8JipkYdSEBPYlqF5TAUdf
 LvsMCP+1CfaVCKv7oF5wq6/Cp/EK2VGOQkUAPBfvdzjqJjZkTA6K5NV3fL7/qJfEVjJgMGssPJv
 z0do1i4RoEf93q58TJsenBnVKCfbdT0YJIOQ0zCkhyHMosRM/oMqRvPvJWG4N9koXGiZXXReofz
 WzICC4+ydlsAJZBuSjQ==
X-Proofpoint-GUID: CQovMlabTM_aH_DKqHlozEZYcKiK-P_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_105857_389279_4C8A803D 
X-CRM114-Status: GOOD (  16.27  )
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



On 10/13/2026 6:59 PM, Lorenzo Bianconi wrote:
> When a MSDU is split across multiple RX buffers, the msdu_end TLV is
> populated only in the last buffer. Since commit e8a1e49c6328
> ("wifi: ath12k: Add new infra for the rx path"), the RX info
> extraction in ath12k_hal_extract_rx_desc_data_*() helpers runs before
> the MSDU is coalesced, so the msdu_end-derived fields (decap_type,
> mesh_ctrl_present, is_from_ds, is_to_ds, is_mcbc, is_decrypted, sgi,
> rate_mcs, bw, phy_meta_data, pkt_type, nss, checksum flags and
> err_bitmap) were read from the first buffer, where that TLV is not
> valid.
> 
> As a result decap_type was reported as DP_RX_DECAP_TYPE_RAW and the
> frame was handed to mac80211 with a raw 802.11 header instead of being
> converted to an ethernet frame, breaking reception of any frame larger
> than the single RX buffer.
> 
> Fix it by parsing the msdu_end fields from the last buffer (ldesc) in
> ath12k_hal_extract_rx_desc_data_{wcn7850,qcn9274,qcc2072}(), keeping the
> mpdu_start fields (enctype, seq_no, peer_id, tid, addr2) on the first
> buffer (rx_desc). For single-buffer MSDUs rx_desc and ldesc point to the
> same descriptor so the behavior is unchanged.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: e8a1e49c6328 ("wifi: ath12k: Add new infra for the rx path")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

