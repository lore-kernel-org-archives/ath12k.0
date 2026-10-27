Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E0606B548
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WAhvFntf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BOiGqC7J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZhvHW2eb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X38EJh2ju+IofiObRyhlPmCV4WP42LFOQnnmfYLHgpw=; b=WAhvFntfTVRbEh
	NSlcoKEsCuXte59H2Fz6FRGmUe7pKuv5mbBztoDr4q0k+8jejzG5TaBIDe+QxnW+x5ew07KZOnmey
	454wA897jyIEObjWK1FaavqAVdKrzLPQCA3YS8cK7BkTf58WNEAENFraGG6Xv/kKC7ozzhfdmDz5K
	4KgxIQFATVZ9tLd5fpS31CoOTD00tuMgwRYCWV2jMkf6XwC1O/mmuWbDhz7QYS5FnDT48fZU0vJQk
	miCO6T2hxuiW+gQXscQHfHzrjh/Dhm8uZr4r1wSEN+V2AmTM0G+ujKGKSu6yeHKO4uT/pLWjYJWkH
	9cWy0YQmo7TvaI15UrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjH0-00000005F4h-1Cmd;
	Tue, 27 Oct 2026 15:39:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjGo-00000005EwA-3VEx
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 15:39:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLE6q2549280
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 15:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X38EJh2ju+IofiObRyhlPmCV4WP42LFOQnnmfYLHgpw=; b=BOiGqC7JjgxF30yn
	5Ca4vRnTTOQOfyD4zxQd1iiBRPDHCKwDHQPIw56yR0IOV02jW/REqNkSWo324nxp
	FqrhlX9NsVhx8nfzVARsjlmQJYGTc1UqAClQtMGCdnPvh2dWbkUz7QPhG736ZpY/
	SXkxK2DgvV2yc30hAzk092/DdGvUEdHld652asY+l+e/wHXVMkQZo0aW8Vod/bxw
	ICzLs8MVKJtxvBRSHn1ENLBRMKeg5TdbgazSvdkRnT2Dc7jUmmXAXiKxYGFmfEFH
	9DiFgIPP7Mh5YasXyRWIAYUzuWLBxrzVntOSgs8f6rbNFg3n3wdl5TrqBI+HsU62
	R3OdXA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69pb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 15:39:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso7634908c88.0
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115565; x=1793720365; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X38EJh2ju+IofiObRyhlPmCV4WP42LFOQnnmfYLHgpw=;
        b=ZhvHW2ebewN5g1Cey6M/FxCdd/JZHNUTCRs2n/JWEEYMGie9oGeWYFhVZ4yhGd2elo
         o72N5tVa9nBINObzyw8rO9OMUuhd94zaZlNNhI3ad+csvau5Xndbd+Sr2rHGUuTeR1m1
         TOnsDsJrPDaiJ3rPR7YzVjA5MB985kUs6/BHnQKG1RcizhFsI0j5Wuv51q+N3mT24jCk
         OfgOL/6yOKdjraJ6TgDTeWj7IxhVuz7eTA936VoRdWXJnJL09/7ajpRVeEEzUDa4BIjE
         IXA4YkAwtHnjztuz8ySuwNXuDDlCPGgqkiSQmiQLk3cOBQ8cwwLSS6GvSFExCaA41MMN
         Ghvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115565; x=1793720365;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X38EJh2ju+IofiObRyhlPmCV4WP42LFOQnnmfYLHgpw=;
        b=py8QO8aW/HKsmESpRh4b3tw+J0xG6opmmFqtmB0LatyJOBc6CqBPPGlb2ypmmPMoea
         iHaErd2FElhwTIrYilZ8ZLLfipdxZRillbtqZr0aHOTtZDhiCx0XmNrWNXRn5U10k+sp
         3sxSEPPXXVScwrDUnz7e/P9LbOOv+9CkAfdZbQvWGfDFfVTwI1tlbWOAlQeEtIfVBlp0
         oqZFLDrWMtJUDI/ANs27P/QsgHOkAYQtszTqrxKomRAX8Z7Xdp+sLXpUDKR7blahRM4m
         NZmHgTQoK6wuFtrbNAh1m3P/q9KHDj12Kc9EwQj7SLtZ/XodoEmnnaWRRFJPWXafk80x
         Mh0A==
X-Forwarded-Encrypted: i=1; AKwUvByBO5AatFI4YWnGacL/czetUwwbbDz4rc8AT0VkJd3kot20SpXZ8Wu+1cri0eQQgu7RFOWZuEs=@lists.infradead.org
X-Gm-Message-State: AFq9FYJx0rH4KV5ojEnOEVCKCkPC4TKPyYVKgH+cPH7Y2JwD9eNujoFK
	pKyKMMdV2q4gahzbdVeGWH/l1sBjSiOUjKhEZL9hISGJ2COKeuN8A1nyFwuXd90TyX2Wprw0kYY
	phASEW0Vn8w8NVy5O7RWdurC0UdCE5GRX+RH97387LK+/6EH0xCnY6U1tVN646yGv
X-Gm-Gg: AYBFou33SSnfOxztPkfDvXNom0Dm1OPT8v3PC7jrwsAPpTvkku7DJzM59D7ey0RNnCQ
	wAoLEnTbA18Sw8oGBCLs5YGFjmOrhfzI9yfwtwrt8EvEo0xd7hQeUjp47469fV2+73VWqhErcss
	3tlun/juSwbo8ft1OTd/AR9RhPvS/fC5+v/6Rwh7LkXqRazmhqXMKTQpme5wsBDuICMoUbu+v8V
	Xdh/UPl2ij/4NF2E2bMvMbDyP1ZenlgDVNmi1uSh9DioMRiO+DSXc+HzcZ8iB3YmG8IRPa/qqUT
	MGZN+DrgX61mJRuv0Euw9UMsuxqwYxcjcJSHRzhtkT2s+j63BbqsE1CDQxJWK4bb++MFhutj/By
	CiALVjNH3QD0q0UCyo77igGIzlaHjxClcPkezT8F+lsE=
X-Received: by 2002:a05:7022:43a0:b0:182:9071:3249 with SMTP id a92af1059eb24-19936b55bbfmr20976574c88.30.1793115564586;
        Tue, 27 Oct 2026 08:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:43a0:b0:182:9071:3249 with SMTP id a92af1059eb24-19936b55bbfmr20976528c88.30.1793115564010;
        Tue, 27 Oct 2026 08:39:24 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19886f790e4sm33278121c88.0.2026.10.27.08.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:39:23 -0700 (PDT)
Message-ID: <c1acfddb-2132-426f-9a23-472d8339dadd@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 21:09:19 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath11k/ath12k: apply the 160 MHz NSS ratio
 to the radio
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20261021165138.388593-1-julius@bairaktaris.de>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021165138.388593-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c5ad cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=3nNfWbzjcN_1ptO5P9IA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: XpMb0zdWWwZwyyyqPKe2fEjk2KOWro3f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX5n0gRka6rTLL
 B5AhgFw7QExkf8M2KagfCrr75gUTm37PGzEIjD2T5OBMnV5RHuIPAZT8/FXcxWwSJWfF6pNPpX8
 ys4iHUo5ISdtctoBCFDFCutHkjx3c1w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX2NmiPnWnA+Es
 rayCKbgIgMNwqKv4XWm+bx+ckSj3zYhnUSMUHr3BqJE5aV46SjN672m2eeFdcS0nvxAy4KeW/j8
 yjqv3qoQsvJF0QInY9LG/2l4qT/vwNjpHPse1FtRy+Y1p8u4lSofBp2BCcgaYTmy8xuJKudFt6W
 z9QMlsbb0rgUs+Pwv7lN4vTP6TndPz2oZMIvNVH8fXx86WLOvN8MHLzQhYdtgQ1ytk5WQq6UTUN
 NYtHy7JdNLcai7JczgR7o65LVKgeU0KOdluwEamu1/D62+cpGAE10kFw4XFIkYOFbbla/qQufWM
 XE9x7ygkuyyzSaDOcL9BWcQPJIbduL+jBqu1skcWr/DTH8oed4MrC2CRYNjtupgWGSLLnV3yQiA
 qqLtoclBq5zuNildrMUsyhV/BIjxCQem4JK8nip1+tZb56t4vEq7zfrp8ao4n9dxx/WMr8VdT1L
 UtgzltxNluOga3UXdiQ==
X-Proofpoint-ORIG-GUID: XpMb0zdWWwZwyyyqPKe2fEjk2KOWro3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_083927_001298_B49000E9 
X-CRM114-Status: GOOD (  15.74  )
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/2026 10:21 PM, Julius Bairaktaris wrote:
> The firmware reports the 160 MHz NSS as a ratio of the radio's 80 MHz
> NSS, but ath11k applies it to the peer's NSS and advertises every chain
> in the HE 160 and 80+80 MCS maps. ath12k fixed this for HE and still
> has the peer-based calculation in its VHT path.
> 
> On a Xiaomi AX3600 (IPQ8071A, 4-chain 5 GHz radio, firmware reports
> WMI_NSS_RATIO_1BY2_NSS), `iw phy` lists 4 streams in the HE 160 MHz
> MCS sets without patch 1 and 2 with it. Patch 2 is compile tested only;
> I have no ath12k hardware.
> 
> Changes in v2:
> - Add Fixes tags.
> - Use the plain Assisted-by form from coding-assistants.rst.
> - Add patch 2 for the same bug in the ath12k VHT path (Rameshkumar).
> 
> v1: https://patch.msgid.link/20261011123631.1664734-1-julius@bairaktaris.de
> 
> Julius Bairaktaris (2):
>    wifi: ath11k: apply the 160 MHz NSS ratio to the radio
>    wifi: ath12k: apply the 160 MHz NSS ratio to the radio for VHT
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
>   drivers/net/wireless/ath/ath12k/mac.c |  2 +-
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

