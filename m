Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA26606A31B
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T3uiD/24;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCUl1lF6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K+2RzOji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EAFf+h75G8bfaH+hZb4Eei0IjzBUojLNmqRmkAbraJA=; b=T3uiD/24lNRabO
	SwSyfx3d/nVAxIUNFzAA9+EURPDqbC+MoE0OZ2B+fwhCGn4ljAFdSYjWtTTzsIn2nbaAp5XhsGxqF
	sm3qzQ736Jp7baE/uu2sd2JwR3ptttJ4KxQ4f8Yuh3r/HE7RXy/5hLxFuVyec/e0EFWGajKElz9N0
	swQst7t06P3TgMtLfBJ3x7x+DeSjaM2yCmwDgnj+dkSFR+lCbwJUXDEAX57pxoULlHggmtVP6nSRV
	1Ux3DGNWoMZFNngX+3FrXh/TBvhAv64aj0DZBMFwH7vdP4P6hZKf71zPW+9dQex1o9X8icQPkLh1C
	8WJqLsZE6dvlyWxoe5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDhN-00000001lpO-1al0;
	Mon, 26 Oct 2026 05:56:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDhL-00000001lon-1xYV
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 05:56:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b5n91340513
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 05:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAFf+h75G8bfaH+hZb4Eei0IjzBUojLNmqRmkAbraJA=; b=nCUl1lF6kESlqD3q
	enBY4KRR+tEn4OWDkNM7oJykV4EuB2ZytRgiCg5h59S/ubLEJODZzlPPCHIoUguh
	XJ1Gfr+qfP7Q4mUl+mhnm0NYjeWpNfOuhq4XTBBuOTo65sZQEc/RRYQG8btQLxhs
	Unmsg/UoQLKfqhUegFL4DwB3w7Z+09bjUXs+CEUz2BP4Imgw/wytAXkrtQdqCKLq
	6Pi+hvbmFJIQcxARfUk6vcVZgxahSlj+zIeuhi5ftJSBh4QBEyjOlI1r/mWhGh3y
	XIz1eBJUaKWAlIHO53JO6SqUl3djW2Ihtycd/get2pZRrdOQnFJlpQM3s8/gdFms
	0pp1ng==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vtft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 05:56:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1596492a12.2
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792994202; x=1793599002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAFf+h75G8bfaH+hZb4Eei0IjzBUojLNmqRmkAbraJA=;
        b=K+2RzOjiSInOgcpraBwLybcM/wjcCY6ii9y9GAek/v8qnS/QWmpOwoc5pza8vbwjeZ
         CPL/wBRVIdBbxcDnM6E3gZnJNETPcegKlzglC7spSw1YT/YxSB9M3RSv6QN8cDMsenRJ
         Ofd1hPdkg0YLP22F9NVvZUvwrLpTiizyxQbOykCTIzVd/HanW+QNQO4Rj01kq6niay9F
         NHAeP+NaDDTrNv2j9rxcldo7A2kEqPiIrScNDxPdKj7Ny0wmyzd2VQRFBoah+D3g/5Ns
         ez+Flru/cuE4kBsk5Co0aTLmNAnIzE5XiJYkjOVpJu3Hw3GV7RJrcBhD12idVsmc8aFh
         otNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994202; x=1793599002;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAFf+h75G8bfaH+hZb4Eei0IjzBUojLNmqRmkAbraJA=;
        b=p6a0YqIl0aZJHD/jF63HPvWeei1WUla0Hd0gkkfZjXUcOdaPkFFAFSbD1tc7/saIrf
         XkpNViHqjEgeXFfepsDvkn4R0WXShnMg+Wa1JBgm/MIHaAa9ZTB8ohC83klpNWl3uPG2
         00oBuhHCSy9mz5PFmK19/yAzPuGdMxP9y+PQRblNPEyLlnVzX9hAcLMxY8hMHVuuCDM0
         UqieU6c2Uc6iFS8d3FCI+Jqy0A7T+mIhtHD4RToWtUX/wci1ddVfQN5WGWJnChf8v1BE
         L7WIDrSSLz03NGtp65oLtJlLreXATF2Rfsc9c3Tj/HeDeQQw860MRHzAMvITK8VBZEVM
         6ntQ==
X-Forwarded-Encrypted: i=1; AKwUvByiRklxhtTWwDe32aqk3ptIWcY4aikJwwNLAhmd4mr1iqAednTzg+HzlyYhJhNajEdoQQy7Ub8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLC2UwnKR1OAKEPM36uO71oHfTmP0vNw1q0dzqejw70q0QxJ4Nc
	1pcM58npeIbyO8lXfTZRYrNq5YUvdUcMUgxuEcJSwua10TckqkGfxlwFdrDe2JhW/cDwDrG+4Ql
	19AHcWqAVI34pyEzNJNQDz9KiuoWfJwkLH/F6WmdURsfEaoj2P5b8f2ZdyDrBFiW9
X-Gm-Gg: AYBFou2qpRP4ezWHB9rK8x23DpJarY3b7eoU1KNUZLfUA1xwbfnsOuMpgslhxKmgxAq
	c6oCE1UOiPJWkObVa0XgcZmLQYC//UgPPlRxXIUDZdOEOpTwIHed14+VGG2S5+oHrtBl16xOI6p
	52dnBUVL/l65eK/6kCcwoLAgCVxZODOJuOBm7njcgmrEzZAvAtCByKgAfqedkT8mYg94OFRA1vS
	U1Mp1eqhU03rJvArp80kjeLDd3zbUZiYJF+uQ446bP7I4KiW+GBzlOQAJibwUhljk22Y7DwlmlB
	HS+ka/AlVhbrDIGk7UtO457qsvJkj4balLUGqLEJt/4r/EUi2TUf8xyvOtLNz50KTrr1SHZYRdq
	MT4x+N+o4yd66XIuNHCDBVI0GVy5+Ty8tu/OwnL3qLarABxdPglgsCiOY9Vm/mu+WJnIZ06brMg
	==
X-Received: by 2002:a17:90b:1805:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3adead2ea94mr4979801a91.37.1792994201897;
        Sun, 25 Oct 2026 22:56:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1805:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3adead2ea94mr4979788a91.37.1792994201441;
        Sun, 25 Oct 2026 22:56:41 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm6740111a91.9.2026.10.25.22.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:56:41 -0700 (PDT)
Message-ID: <ec616beb-0423-4b0c-b0bd-71a00aad6977@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:56:38 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use hal_rx_mon_status for PPDU
 parse result
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261015-hal_rx_mon_status-v1-1-b32d5a7383fd@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261015-hal_rx_mon_status-v1-1-b32d5a7383fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C9V3D10Uq1UDne5AEpAF7UdbN5_zPRfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX+8QdRdwigFCC
 uP1BYCYgPPHTqI9z613bBEg6M80iRPZC3AeALYqhEekqPh9GyukPAErXCZtZ2vLFF874vLJ/5+0
 Gk0xlP7JHtt/tLiLLKqC22CynVREMAhWwqM/gHUU0rvus+iwm/LDLmwXpoUEfRVl590+dEsl6Yf
 1hiXkCLJNtwyGvQdX5+lkXuPwktejGHUTkvUsSDZERRXVXe/HHLOmtI3Ke2zUuD8XhfWGQj0k3c
 ACO6Mf98FE/YBWb0kdDRMG/II67rzTAwsag/cqeV9x5RUjX7QjDxqPCqojvkYsnyoY7JBRoLcFi
 6XUeULF3REwnUaJWxz3D9x9u7QNrGtge/pNM0M7LpuUyx780OtheQqwvCoYbGNO/eXuO089n6Nu
 gLzV+3ldlY65/aCKu6A9sYQ4WNe4K26kov7j7a5T+it8m8sUH7AF7OvB8fB3OOgvYIga4cW8xHe
 r5cFbaM3wQvgGOKJ9xg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adeeb9a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=f15Pc6MQFNcZvwnbqmQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: C9V3D10Uq1UDne5AEpAF7UdbN5_zPRfm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfXw/vseXDRNFHo
 S3xiS70i8hBgvbF9Cx0WNpMazXrcd/DLWQggLod1+KWdu5gl5ZHxuhILH7LT4SmsepWjIYCe69O
 ORGGcML5EA06CZIi/5587xkZ6LxbMdY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_225643_516267_0064FCBB 
X-CRM114-Status: GOOD (  14.69  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/16/2026 1:49 PM, Kang Yang wrote:
> ath12k_wifi7_dp_mon_parse_rx_dest() returns enum
> hal_rx_mon_status, but one caller still checks the result against
> HAL_TLV_STATUS_PPDU_DONE.
> 
> Use HAL_RX_MON_STATUS_PPDU_DONE instead. This is a cleanup only
> since both values are identical.
> 
> Remove the now unused HAL_TLV_STATUS_* defines.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> index 1e29c13ad66d..7d29b49e8a54 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
> @@ -3214,7 +3214,7 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k *ar, int mac_id,
>  
>  		hal_status = ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp, pmon, skb);
>  
> -		if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
> +		if (hal_status == HAL_RX_MON_STATUS_PPDU_DONE) {
Not part of this diff, but the same topic:
ath12k_wifi7_dp_mon_srng_process() still declares "u32 hal_status" and
stores the enum hal_rx_mon_status returned by
ath12k_wifi7_dp_mon_rx_parse_mon_status() in it. If you respin for any
reason, better to have it fixed as well.


Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

