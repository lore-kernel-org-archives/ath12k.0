Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6BCA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkP2Uy4v+MaznWGPgPFaft+rB/OWiWwtvQUiasO0HZQ=; b=a/84l58MgMmkc2Fx+PqWW1l8pY
	u4cGjsNXuwHAZGN2EWg2swt536GqEdQWSoni5DPxnZje81zB8QWCfC5RgMAwXr2pNY+AQFkvOHn3a
	fJgNSbQS0zradcQpWtcXdjQnVhzqs2NzDHLtB+9jC7ofLpQ9Vq4AQdavTQzDDl13n/nL1XH334iFk
	sQig3nILuX0sFo6utSIOX1dYU8IxVPpsBNQuGYpL9t+nXctIbOEEYyrzBX3IfjTevEKir8cuqE1Vv
	cE3r40GSS+28/Tn2nD6ERfxpJEYNur6Vpd6AIuiwbU2/qsg/xM8Ctu9OOiNgmUPDG6s6VsgKWTy9g
	1CL+zN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpCb-00000004Y8R-3WPW;
	Thu, 08 Oct 2026 14:34:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEpCY-00000004Y7R-3W75
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 14:34:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVRu92801200
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 14:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkP2Uy4v+MaznWGPgPFaft+rB/OWiWwtvQUiasO0HZQ=; b=fXf9WYo8d8d+SQUz
	gvYV2cDepGd/czjo3alOy4XjoCFPxdbyPPth8D/SCZDXI8zbH1yz6UGzVHfWI8Kv
	VudKWSYNJlmp2LiAA00j/9XKCWUhfjs1hzanJoJGy/0UcVZ+9UC8WpsDzSQ/vlcK
	MUxmfgU1IEyWyyxtLBZ3IOKWThK4qo7CU2+QOYFTSiAav/6T6z25NWT+j91paqvv
	ncBGr0x5nVrcgg7G+FAyd4jfIX8vs53gH/SqYx2D6mi85CLGg1Tzv+ZUiVu1aoKI
	cZZd456EF3/MJxW8desZM1nHoBYxUyFmJw65W7C1R4cojgKmzk5JQK0nSsq4UgXI
	RHPrIQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3kd6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 14:34:28 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6de6afc4ad3so6130881eaf.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 07:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791470068; x=1792074868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkP2Uy4v+MaznWGPgPFaft+rB/OWiWwtvQUiasO0HZQ=;
        b=VSkvvAPRICdbdLz+3xFd6x+80peLNcMAY+MYkz6703QyjiY+/1gmNmDo1vw/6AXB4U
         ReWgvrfzUTUcsfmoTf06UfMGhjvmFKXlBTA4wY089J4lTYdt8+FiabNNuqsi2zar7Bt+
         g1tkMWOwyDFYsv87mr0vQxHgvGjtXXc4//DYL+mcxCicZxVSGJl4SRb9bFBLJ97oXbii
         TIqp/wQvgRJo2DYoTCTV6tqVkscgW5ThrEIEImdbaPtigZVOhfbAJzMs22n0lUVhRSv2
         LBw07RMOjKT3xmnUOp6EAQuRXxnFV0kDnzg7KXF4GvYZ8JsLDiBIYNLNMYSKSXaUuLfg
         W6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470068; x=1792074868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkP2Uy4v+MaznWGPgPFaft+rB/OWiWwtvQUiasO0HZQ=;
        b=XVpfki2Ub+yNnWpdVtjGmlGrRhfvd84WYHRtbGyYO3j6dM07bmL45ICmLRmbLh2Dgs
         tWndSvQrdBdPodkR7N7TA4pSiymy7iWYb09RgS2vZBFsI7b0cxB+YAiJzF3MyxbgwHUq
         UkybS2YVbif0fpCRtuHu7M6noOGgWs7qP6gjQFCGtj5X45pTNHGEsRxhJU1xn2QGCzRy
         XGWO8lCWVjEqGJ+SAmfzDxXFLeyw/2YvokclpqhLUFDDr1feUFkr4Kz0T2taWcSp+OHk
         hJjG/2EFTRr0OeK8A/oA2Qa1bZK+zVvahw1A60PDlxB51u/at944NLFcDfIRa8NPy7FR
         Wd2w==
X-Forwarded-Encrypted: i=1; AKwUvBx8KtXMWUxzWArYEjPn0RxGvCxmVQKngKmsJ6SrCb4Nd028JByhmpU+pJJaE03/7prfBmxcnLo=@lists.infradead.org
X-Gm-Message-State: AFuF++mvhFvWxrO7nNIvgvtWgly9ko1OYZXknqFgVUYSukS+W+OGyxjH
	9nEOJ9ZXtE1VNNUFqWEFcriX6mHcBOi7uoXXOsWlhjIsltTK3zmd1uqa9fzMkDCrT+ScZlSCL22
	u5E0m2I6TtEUWjypr+bbzSfHNFIAFa4WmDQa0UEsBl6VW+VCxZZ8IjCd34cZdGl9dZX0JcLlR
X-Gm-Gg: AYBFou3B1luSKSeCiInoZY9N88KEhKOz3kl1I/NsqwmrlXxBXhTIBJO24IAKvpl53zn
	sIU2MwhP/OoPIUWagWCYyvs5gwKRePnYMhcIy6SLIXuEhJbAa8GPJx5S7gbgzY1BWTlyh4Mrv+6
	3WjED+znGmmuKuTiTk5yQBXrSaB5e7ElvNzy8lL/8Gz8eHUT2kslN71ENaTS2YmRnzDkaYwEx9q
	HB8Ai91Wf33HGf6mH1UV46MdmDj9gDrzN9vliAs79H4LJAJrng1HkHGVU1qDryqDmFZlKNs7qzR
	z4jo0ZUcFVrE8gndilm9RUa7kWKf+wdV4BN4WtGybeEHPpn/6yUFUwhsWHaXOLCNjZDqPGPSnLz
	bS4dMRORfI82NFhzUXQlRs4ibPC/O8Nk3NdMjV9FHD44waueCs7W7CrqPsg==
X-Received: by 2002:a05:6820:1f03:b0:6dd:6d12:2317 with SMTP id 006d021491bc7-6e7a65ce8eamr5150936eaf.25.1791470068134;
        Thu, 08 Oct 2026 07:34:28 -0700 (PDT)
X-Received: by 2002:a05:6820:1f03:b0:6dd:6d12:2317 with SMTP id 006d021491bc7-6e7a65ce8eamr5150867eaf.25.1791470066608;
        Thu, 08 Oct 2026 07:34:26 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e7947969bfsm4634414eaf.13.2026.10.08.07.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 07:34:25 -0700 (PDT)
Message-ID: <5f55176d-12a7-47aa-97ae-9a2ea071d815@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 07:34:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: fix datapath lookup in
 ath12k_wifi7_dp_rx_process_err()
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
 <20261008-ath12k-pp-v1-1-68f888cd7eec@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261008-ath12k-pp-v1-1-68f888cd7eec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1NyBTYWx0ZWRfX90y2zOAM2hiv
 MSbw+tVHAjfDVPFQS5RT4Bp859y+4g4rBYNSidE1p9vKQf+g8Bg9VLtbrlLD3LmooxIDfUKZx0t
 3RmBl4wD+oQl+8DujC5h50HFBw5RwSc=
X-Proofpoint-ORIG-GUID: lnSA8uPPNacJ3-m7bTSyh1i_eQ5Qz0oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1NyBTYWx0ZWRfX4n1eHGKuCiHa
 K5Efq2nacvpzg10t+f5OvBSL5Op2A2TUEdGWW6pIcLBVeYdG7CgHSjCo7f97COVDqerO88qaJZk
 1eUb+RSrWQMWkWXhsiKoqa3a+pgnqbu8OySpntfurCrisoBm/zucZlv8DUgPAMYZyDPaPRXEwrB
 lSEyuWS7LbeM/gCGvW3ipvzv8SSsi/qAauc/6qlJ80dwntMw/Cb9DR+IZyfOVqwObsRoGuDxkxU
 1Ta9ftTezDNPHF37CSUBR8Vfbvt5EXcDwiP2ue7KXP7AjOFTXb2fho1J/sFCYGv2IbH3nYMjIAe
 eGv2LC5p1VR5/hv7SCGML5YELguYuRh2s1xMQhx+68Nd241O0bOpR+vr727Nfm4j39tHKLVCi4L
 VccOc4Ky+tPwd9GVu3aXXlhBvSj+eOQxgID3QR/pY7L+jtlxNqyPMcbArLT2f3ph2M6GGIBiVTk
 lksSeUqCsAWc2P9XPVw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7a9f4 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4Fw9wu-kcVuC5YJyYxcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: lnSA8uPPNacJ3-m7bTSyh1i_eQ5Qz0oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_073431_010504_4F01AC32 
X-CRM114-Status: GOOD (  21.20  )
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

On 10/8/2026 6:15 AM, Lorenzo Bianconi wrote:
> ath12k_wifi7_dp_rx_process_err() resolves the per-pdev datapath with
> ath12k_dp_to_pdev_dp(dp, pdev_idx), using the local 'dp', while
> 'pdev_idx' is computed from the owning 'partner_dp'. As dp_pdevs[] is
> indexed per ath12k_dp, this picks the wrong pdev when the REO exception
> descriptor was sourced by a partner device in a multi-device group.
> 
> The error is currently masked by the drop condition that only processes
> same-device fragments (partner_dp->device_id == dp->device_id), but it
> is still incorrect and would misbehave as soon as that restriction is
> relaxed.
> 
> Look the pdev datapath up from partner_dp, as already done in the other
> Rx processing paths.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Tested-on is not an official upstream tag but is an ath-specific tag. There
should be a blank line separating this tag from the official tags.

No need to repost for this, I can fix it in my tree.

> Fixes: 9e0ee04f818f ("wifi: ath12k: Refactor data path pdev struct")

If this issue is masked then IMO we don't need to backport to LTS kernels and
hence should drop the fixes tag or add Cc: <stable+noautosel@kernel.org>

> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> index a32c804403e8..633cb91b9e5d 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -1536,7 +1536,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
>  
>  		rcu_read_lock();
>  
> -		dp_pdev = ath12k_dp_to_pdev_dp(dp, pdev_idx);
> +		dp_pdev = ath12k_dp_to_pdev_dp(partner_dp, pdev_idx);
>  		if (!dp_pdev) {
>  			rcu_read_unlock();
>  			continue;
> 


