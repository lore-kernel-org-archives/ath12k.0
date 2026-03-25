Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B4E109C05B
	for <ath12k@archiver.kernel.org>; Wed, 25 Mar 2026 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=; b=ABR2WeFJgYnTSfWltwqxJqtFsg
	SOuc+n0oQMsfgf8BOxJxHU5t1ZBkT9bmh3+9YC/QWKQzPJTly6M2+nXGjBUbM0/yAys9TFhrTIdvH
	jN4ChPObPESHHp8h6zWK1KO1xIL04xqnGztsItNbVA4s/OQHX4Fxtzf6+ValH7Lo/9eXs2Cgvf9oG
	rrzeELduM3EgRjijKLc7cbx/9guAHOZl0s+lb2b/3dNzRKV8NMnn6qXMrsqszu4hA9HhaKDgjbTlN
	QcUIjr65QL5P0ox4UgTmAC5ZgNuJO6xCSj5J3HMXBdOZ1o0YPPHd77q7R9I3cUaGUxnynyPd84HnO
	3y5MabeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4Q-00000004AIw-2v8H;
	Wed, 25 Mar 2026 19:39:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U4M-00000004AHO-0wQG
	for ath12k@lists.infradead.org;
	Wed, 25 Mar 2026 19:39:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH7uF2432173
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VRX2TeJnAfqK61YrX26wKqVI
	j6I4aVlTC7JyT6LMrPE=; b=Jke5vlqLOymrsMkJIXGnGSKhUONpLkcA6PDaM0B6
	AWwh5Z9j9fz351ENI0ktAtJl9KNzS3r0sgSMlxlTMFnKsJyfimnyzbC87+2R7g1X
	YWqmDUOr3mQKoG9dUUGB2uXOunzALcWuQHF0wKSPtFtaXuzqkTlE96AWUVX6d12G
	cG+fBupcCN2s3QRBJEs11/xzCKxRT5edwla9jJZkTAhJf7pBdreCsiZ8RZ48Zb+R
	tcLx/TwMuT+WEYtIQFOoapxCo3CoV1gCpjbvBmxMnWqqyrczPcWvWxbZQI4mAx7A
	0mqGfuwWBd4XZGC/okK2znzqDlbwaQbnGt6QyslMRxsfnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mkbxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 19:39:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so13943131cf.3
        for <ath12k@lists.infradead.org>; Wed, 25 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774467548; x=1775072348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=OOx/LeDkTcZyuHV/Qc7dNu3r1K2gojdHg5IUbWsnGH9ozBqeWf8Cu8UxAJgn0PNw2p
         UOF01ed3mU7Oquq5yN6Me3SKRDJ/jpvEuj0yk9QjOBRz7GnsADbz7oHboSELm3mH4ml7
         saMkIxiQ6F8O9dqDWT6CYVeWLXzPJo/jYIRpE+r1k4xNyKmp14SfryRZsU2IFNfEOnMG
         MH29B3efi8o/RxhJBmkTYywwWiuJ0FjpfLd8IAARd64Oz/snK2XdO0pG+ObRGrUM5y4C
         YE2rUh5oWOf2zrxybzMBaLsSx79OZ3WxGLPWMuTKwh6rqarghO2YOu5wpnrYadi8TZLg
         /WGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774467548; x=1775072348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=fdldBmoYD0SNq8WLhq4acNqZhU+7PBhxrPm8y5D5E4TQsSBC5q09Jya4j9G5kdaUWy
         s2WPzRaN96xpck050JvtXt3azoWQ6000T31XGf8dNQt4nmNQcUCQm3BdN988SO6EScJb
         3Hc+1U5K1KiLXQR9L4pSCEMJ/8sEQmoswvFwyJuXBmtnqZ/7DIbdSzzkCP/K+4Eiwa9e
         oawoUWKNyFATCOhVoXv7W6JErk4domYUD3wu0XL+WwCP9Lct78TXD1ppYDcKJBqD62Zy
         +9hFVEe/jjyP582Yr+pszpWOZ0NNoqPACQrZmAUmNgp86dHofRLRa9hO1p4SfueJt3Mp
         lWPw==
X-Forwarded-Encrypted: i=1; AJvYcCU3j7W9m8sbhOIv1QhFLWDXIPlwsigrrJoKBtYBxDj13ZU8N3HSB97bD5hQcYZN0eYa6RhjEcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNT/baic3zOCD7L9i7WDJCk6L6IpCNof+2kJrP7nQy3+fWVlqh
	eBM3iAWWd85ZfvyJLG6eEjTOga7YFOWwn80HNtLvGQQ9rblzk/ERziQPM/q8N/XHYWAyzRTVNjo
	GhhE9lh046/7EuYdYV9yw6xUIHFPDK/Vk958l29tG7c456w0j+Q2ehQDrvQV5IvSMv0waC+bI
X-Gm-Gg: ATEYQzyGipTf7p2i19woNjnobCDedADkPvr93CEQax/qa6mqYvyy2GRc9bSA8hIVhTs
	+Rep5Uwz5bbAOeG060hLhzdVQZPaU6rVV5HBLjmlR49BUDvnXPFx+HQRqFKy61sPj6KHPGyrZ9k
	d9uVwTG/0qUF+poy2IYR3e1uxWH7hFvPsmQwTrOX0r56MSI6PNVyOeXeszahkZX1Qn4COVMjXr1
	zrVeLQpH5qLlCL6KzPBCySjFpZICFeRzbPxCxxFPb83ivQ2hoV9vWIg8zweBaJFUzAAWav8M+dU
	WIrM3kfOOgDg+h9Fff3I4RluK+dwe+9jugV5mnlbrZaLsaOzX8IzU4DbghOWyXmQ+trClxxDyKN
	IbhdhfyJeo4gRP19yvzjyTq/t+u5ZwffWu4CNYyR1gJ7nz4eT+YKVH2lBVfnMJfkmG+XO/NaPRF
	r6FLQLAssL59Ucq6LTnpRH/ggENotGwLQo4fQ=
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669931cf.60.1774467548254;
        Wed, 25 Mar 2026 12:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669501cf.60.1774467547795;
        Wed, 25 Mar 2026 12:39:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm91843e87.65.2026.03.25.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:39:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 21:39:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260325
Message-ID: <4zrp3tlsqytyuxau5qk4hnlsht24f6vlgv7pyhb5y5cswgn4c3@4imh6ktclmfd>
References: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MyBTYWx0ZWRfX06ah+4ga0PfP
 byNW4ErfDECjaDoFerV8mEGYSyGBFXPVmwTqltWv6jWfeJWJSnDfN0j6TSYi7dBfVqFLK2l0o7T
 SDM7hkfD3FQIgLdnnuB3ciCRJs/UBarufaeI8DUduryL3khACYO5yKyj5f7nWwe2VG6Uao/wH/8
 Fouwj+wbkBHnZkX4mC8tZ93QyJO2UdHfNQ5sKyHlrB8iQ8OxCOFZwncIOdEnw/HJu+N8kG9Yg9n
 nW//+e5mINRPgaIpdWJv8k1wj5eIkmYyGcQPlGqA71uJ04ZXXeM1tPJc39s5z7tYhZjhxurEWeL
 JjJm2+en3vjge2gUgw96qtNjsBX//L7EJrogr/O5IjUSCZsWp3N900GJgh0Gs5k01bO5Q50l36a
 COEyENI6FVLZHqQUVsaDUqT0ePzX7bhjVm/nEJv1ZA4whlVvIKLSx6gjebpRK2WOd5176neAqmK
 XmU1MLzCbXukKpFcbBA==
X-Proofpoint-GUID: 8exhJ46nT_NTUNn4A9Pnxce9lpJ3aBV2
X-Proofpoint-ORIG-GUID: 8exhJ46nT_NTUNn4A9Pnxce9lpJ3aBV2
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c439dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=FOHEAjDUwq7NbCT47RAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_123911_094995_F9CF17DC 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Mar 25, 2026 at 11:00:04AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath12k
> 
> For ath11k:
> Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/974

> 
> Thanks,
> /jeff
> 

-- 
With best wishes
Dmitry

