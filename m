Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B6BC531C9
	for <ath12k@archiver.kernel.org>; Sun, 26 Jul 2026 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeLaR9Pb53WBH02Eg6y9/hRQC5tvdNBAcvDEKa/9DhU=; b=mfnDSu2sBmlrynpHIy7iscvPAt
	bPuMy9LpkxN9s3jFkAGJWezCsKvj2YszzjLsK4f829MAZN2zjMMD3Pm98yHvc+HDDi6Rgh6Av0SQX
	Gz7jeBY1oUBIQqn0pBK+BLqZH6Mr0726imZo3/yfCffOLaa+XBjlmt2jgbRkx4vrgP4OWab3QhZ45
	rv/BLgIJsfhuXFPDHkFq+bXxj19B3p9kyD+z4EPjEUVHmQClf5oALuDD7Lyx/DjxWWfszKKwVEPTo
	0Qen5PEdv8kcH6mFSM8YwyDackOpRxJ1ACOesxifITo7nvRJArz4d2Ry8rv+40vY99iXHt93qz5kh
	8HQL5zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1HK-00000001JzM-0I7a;
	Sun, 26 Jul 2026 16:00:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1HH-00000001Jyx-3YaL
	for ath12k@lists.infradead.org;
	Sun, 26 Jul 2026 16:00:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE39hq344428
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 16:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeLaR9Pb53WBH02Eg6y9/hRQC5tvdNBAcvDEKa/9DhU=; b=Jw3vwd3jGwFwJ+zy
	ys/qrQZmQz32JZyVHCPXCj5jd8QO4y6ocBbP5jWXkGR6bijMNJLW9Txsm2AVmDvg
	2wVWoeuwx6r6g0V3wXlEEIK/9xVGMqRfN8XEKANCb9+qDXQ6InrgjWHJ5oiMLcUs
	1e2uCgXI8w73MMhxqSgqm4TepxpYyzP6MQDb14ZmIIhDDlPGi9cYDh+9N7qvJy6s
	fLuH7PB8zlRNMregIhxmENGHPQ6/GFYjHeTP3qUPgPzG67MdS36IotE2aQI6FdTj
	R8QbGXXMUO7QXZFN6nSUrFHbR58y5RxpPiYPYOch9bJ5MWa8qL/Yj5gcl+H6lVDM
	hVel7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajk2vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 16:00:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1466884a12.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785081634; x=1785686434; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeLaR9Pb53WBH02Eg6y9/hRQC5tvdNBAcvDEKa/9DhU=;
        b=JDKgoO0SqqVRWxDb47Zjfe/ra+w3jqIXpk5Y1fQGlJBQDZkDua4FJQJpMjpvomP+Ce
         K6F1t1mt8F4+hx8OA1piuTSf5Z0t9XHJfq90Dis6029ZfimveohlMIQyQ4k/kpc9sGfy
         aFdOQcL24qouE5ici/SAkSkvXz+z7fn4WTBV97dpKqI98+6SIq4/rbHwisA9kpzzlpMW
         TL+n8Ba+47ej6wKZRyn3F8iwb87D4nFUUSa/4H/k8AvPgPAzGqXNSFWjfvU0dmpTVkim
         C9LpWEc/xs7KyYZR89gbhlSfxHy998walwLdpWnAOHjOUQKvWNyf6tMHTUgtllCqLmrL
         SmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785081634; x=1785686434;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeLaR9Pb53WBH02Eg6y9/hRQC5tvdNBAcvDEKa/9DhU=;
        b=skOK8fxLkYqKig+wFzlR53312eMymxI+yS07k6Z0eSEY0aLkUOyfu7WUOLJY4QgZlD
         M/0Ftxiy8sMXfiRkwpxbUFSuPaqL1MXbzLrIPaq8KOJtNUVQ+yU3xfcTINn3EDUSZKj+
         TCdGgOMFkDsc9j2DI8eJnQAjDRF+iu7fdGjUdwqPHzUbLfFjtobsLZ2a3MKyXCb8qf2Y
         Oop7NmWVXePrjh9xUp27nwTlgu6paU5vjSioTVQD9WmkD/lFFKd9PUCiuA1DCyJxGT4A
         PHLGfLIoXKQEMisNPc3SnNg1Pzgp8wBlaSQrZvZZXl8oaoY2ODaqG3hzn4xhrWFd5n5q
         +SBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2zsHPmt6nNN2thHIsbnp4+hZvguNsHsA7VuAW0sYLYpuVO9GUa04uSRlabe7gaYd8Eg7zOY4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywql2HCSUdVBo6K9VTUVWmg8CLMjQWU+tFRctmnzLhiGXlnTFjZ
	zfgrT9gXcjgHGZRLwiT4ww7RBGNKVHoCH6Me/jP1Ke9xocNJRgYIi0JGpnzCEcgr1xA+DWZ6jjK
	kO3fHfw87dbU39tYDTiVBULJ1I7hsirZh1eEQd59Y5TlBDYg5E/o+4OhWIcLwzzjN
X-Gm-Gg: AR+sD13ks0KmkuD6+NQkHeeEet27I6+SEIWWJA1lQBlvL+e4oR6LZGwoxIlW5tX/o++
	Kh57hoN5oUKEDZUM8nodQ4W6uNGEKNM3+d4dJBMK4LhGC6u3ga7mKXY1Ms2nYPa+xsRBCVpK1UY
	uaiWWVV4E2VXD3qEe2Q1hwgs2DV8P26Lvf5Nnc9DJuxl0krxOVp6krcpltpzV0dd6URlGWg70Pl
	jnSDn9nib38SWrv1iRZrCQASDVjsAfo3rX1jkgnfXTOVvv7NjmuaCchqD2kWUauyBty/eSX84Uh
	56jCAxV3MT+fsM21dhl5uGKX7XKQUB083RgAchFJ3SrPhmhyFMTojrk+6fcEhQcEs95jmKTkVlZ
	7sQRNUZGCSZC7qVc9olVldfeOBOyNmMN124l9gFamFsqVz9oapyiGO0pYnw==
X-Received: by 2002:a05:6a21:9991:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c67e01ee1bmr5230262637.72.1785081633869;
        Sun, 26 Jul 2026 09:00:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:9991:b0:3c0:9c19:65a0 with SMTP id adf61e73a8af0-3c67e01ee1bmr5230231637.72.1785081633402;
        Sun, 26 Jul 2026 09:00:33 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm22480579eec.3.2026.07.26.09.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 09:00:32 -0700 (PDT)
Message-ID: <49f52ca6-d2a5-41d4-9952-794dae91e32f@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 09:00:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath12k: add WBM RX error drop
 statistics
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
 <20260723125448.922361-6-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723125448.922361-6-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tDEoGPFEHSLGHVc26Y5yydIois3FD5w5
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a662f22 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=szo79jg_E3-Az3Xz7uEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: tDEoGPFEHSLGHVc26Y5yydIois3FD5w5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MiBTYWx0ZWRfX1Slirrfc8NCu
 miMYXY00X5bzGAM9ISPQVuxrh6e7yT/uKGENZhZkomdlO7BXuj2Kn3dMGxAvw2uef0EpRKArFop
 66yx4UVSNAzv6nbPOVfjDC4ylhtCbB2oPE5CXaqcANWEmKVPMt6aNgGZVO8WoQ6C6mfkg4YuqFa
 Md160xbp2+jPYmgxyYnIrccDL3Go3tJo1sur98FDAu/d8E89vv4E0yCfSi2uWp8S3N72dMDiKUp
 zJwmrh1XhjqKBn9KMTcNOW2AOcp4E4yQCNBMcdbJIJZ9ofd5T61YSKLTHHmZIM338KokUPurAaK
 fmtalp+diWVmKQhO2FliclpTtUoQJEnBhY2lFiv4cvicMSyURsPLAeLUf8MEVRECDl7iXJanMPq
 Jw+2UOUU2/YeGTadmANjBdmQgMVO0EfcNj350rW/zyoOSHFuueOSGPtBfU0Ycr/o9Edot81tefP
 f687MtW+95HAX/8tBQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MiBTYWx0ZWRfX+2gtG3EtDSQh
 ldSz4lta+xP1G62FvhZsU7CkpFFkl9IMQwAO6cxbGQKKertGEXbipMO2IZHmJ4uL8XTzT4ktDPG
 Y75V6C4gsJsivOkwKu9pJHlPDzdFyBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_090035_924394_95D28637 
X-CRM114-Status: GOOD (  10.25  )
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

On 7/23/2026 5:54 AM, Pardeep Kaur wrote:
> @@ -1961,7 +1983,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
>  		device_id = desc_info->device_id;
>  		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
>  		if (unlikely(!partner_dp)) {
> -			dev_kfree_skb_any(msdu);
> +			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
> +							    WBM_ERR_DROP_NULL_PRTNR_DP);
>  
>  			/* In any case continuation bit is set
>  			 * in the previous record, cleanup scatter_msdu_list

My review agent flagged that between the blob above and the blob below is the
following code that drops an skb without accounting:

		if (err_info.push_reason !=
		    HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED) {
			dev_kfree_skb_any(msdu);
			continue;
		}

Should this be counted?

> @@ -2007,7 +2030,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
>  		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
>  							    msdu_data);
>  		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
> -			dev_kfree_skb_any(msdu);
> +			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
> +							    WBM_ERR_DROP_INV_HW_ID);
>  
>  			/* In any case continuation bit is set
>  			 * in the previous record, cleanup scatter_msdu_list

