Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CE5C53200
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 03:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZugYL0Re6FLYLg+SfCPuv2uALiGqd6hDKlaxGiHPCHk=; b=vPOViIvWW7Z6Ad3aCzK9SabsvB
	M4KbDyUquyBDpF2011Fh+4agUxLS3RIQk1UKVvF9YyQlGald1vS0wPJu3TjRbQrunrwaiZu5XHkYM
	szp0Fu7VS79FmMboA7dImz/+7Y5lzn6nppX1RPC+gCAEXP5EmfU//NLHkT6YFb+RqFWx0/eT/qQ4p
	ryR6LXO4G+oT9Kz+0DDLHjaz6sVF0SvrRvM8fg3EkM/pOgIUQa1PbAn/X+WVj9R/LFnAdhHF+TvHg
	2JwxqC+/d0iivulr/0+KTrfWI1pj3l52RI50FCvpIhVk5FCLT5Bd9l4jC92R3FtlMLQV99dpd4qZy
	UrpvEGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCEO-00000001tCn-0vwF;
	Mon, 27 Jul 2026 03:42:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCEL-00000001tBe-24SV
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 03:42:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fxDR1768480
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZugYL0Re6FLYLg+SfCPuv2uALiGqd6hDKlaxGiHPCHk=; b=ZGdpYUJc9v5CW8D6
	wlLEAw8ZD14SwBmGbfrm9eVXnKDHkT4LBsfMpt+khS3xkZ1+xFb1XIS7KUqXnGk0
	J6+V87xDTXkFxtnoWeVszUcL7DwHxa5Ens0PmRP1hOvQyuNQEONRy9xDgZhV5xCx
	pEHynCb9K16uFa6FBwtfvTd4AoXAMG0NMelnzRG9+o6J5t1nfNF2nT6U+iIU6wyp
	PhYWADhjYLcRMlNVWM9+nOWaBq+xlUbZEVyV9Qt7iny2tmaPyt4/70ekY/gxFHaO
	wLi2ZJnrZgw/F5kjS9dGFXXGrVYCerr4ZQ04c1KYr5zBsDDaF/uuT1tuc+qpOdF0
	vQnpMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajm55y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 03:42:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso30841715ad.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 20:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785123736; x=1785728536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZugYL0Re6FLYLg+SfCPuv2uALiGqd6hDKlaxGiHPCHk=;
        b=Po8bWgRk1Up+JR2stqY9ALXFSNsluhrHvYKCoAxwGqpqNoUSE6ZAzeu0DhHOECaJx9
         10T/zhlsdxOB9AL21ZRobHEWUuyfv2UpjF+eVWRGp7ynu0JF5maL57SqJ2wBOVZPEwT1
         J6UUG9UsCK1Rv6eTzZTbO1tw9i/soDzJKmn7zhIQiLRN+kqzkC3ksZKaIBBCBOXObPaB
         z4jXiKYRRBrW67xnz2vTELgLdQNe/avXZnRXur3o/YK55HcZ/fVA2mlxMPq5SDETu5JT
         g5cceudVWo9EOrjSDuaCJYDupxu7KS1/n8IWn2U5962Ga4YVhTrMyRQKyAS5tJVPwTdK
         qY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123736; x=1785728536;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZugYL0Re6FLYLg+SfCPuv2uALiGqd6hDKlaxGiHPCHk=;
        b=ANTOvXgJ4liXap6RobNrBPjOmgV3YbdQ4C5ri7X3gdiNJLzO+KNuHP/IEWSTEtRGzb
         UR6ble19DRa0BpLySW6pXBARLEHqvNExZi16wpGro6CFJ0iWlMaxNKWMENlmicd1Zh3f
         gAgtnS2pAxQwp+Ps06JU+Dxj9RYYviRYmVVTyqrLei6sDhfiOVSJ2o60zGEakGrTSCcj
         OJk2uRSNa7t7w1WsBRQDgnWN3BA/pLZxkGgRqFCPLBpv+HDVrXbvU7598ajSRdSWri0M
         wca9L9r8vokAwcFTU2TMI6wcCFtOWsjzlngMPEiHkazrcmdFSNFzzNxfT/qoHJVlr7n7
         pumg==
X-Forwarded-Encrypted: i=1; AHgh+Rqwds43ChYICwHz8PHCr8RPSCJGJik1p4aabWHJsf+SZBuRjSpjEM6DGGVCQOPdwv0bFjWJ6CI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxgiKP3hNLQZVg+Oxp8Mc+hbQNVhjr6p7Uic0z5MCFLYBNxJko
	XX6e66GNPunfAu8NIUONu9M0vHXxoStESe95jsMVvvkI/NzRaeXUrkeU2hneQc6Oj7krqmToeH4
	NhS8ClKNSRZ7z+Q8RFvrQIs2ncz+UYAywNlIszNHFt63qlUomKDLgrDSUnf89llcV
X-Gm-Gg: AR+sD11rZru6SQow0rzdPhfjtAIfcVt2XdYRfem6SmP2vP9J6FriAFyBZ6lMHJO4oQ8
	OBlchrWaxsjkoGkewAFshXsk52GEOPg3C03Ws6ai8avRDbNij0HEtGotXfXk+9KNMp+bwvmqMOl
	w2yNbWwXtqFu7JCII4TcyQZ9ujCsJoESWwFekem8OZArEwtPQEYufXfuUzzCGqu2VFB3PJmhONp
	IZ1eG2GOmda1uHE5PKQVnioNGzmFJKHctfFhYl5gdovDvzssjZKu/mPkvzRRNqcAi78fyJ1VnmL
	kGP1hDkSuyZ6VaeWJkmulq5DGwgwa0BFFl5obog/6KTTHxVF9wiPVA6rZeLr7PMQRwYpU+jlFbw
	VrtNZ1lWFrHnf4mKhO5aZBXJTpTpNQFo=
X-Received: by 2002:a17:903:1448:b0:2ca:b1f6:b0c5 with SMTP id d9443c01a7336-2cfde8778bbmr63741995ad.38.1785123736378;
        Sun, 26 Jul 2026 20:42:16 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2ca:b1f6:b0c5 with SMTP id d9443c01a7336-2cfde8778bbmr63741735ad.38.1785123735945;
        Sun, 26 Jul 2026 20:42:15 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb40sm26819585ad.9.2026.07.26.20.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 20:42:15 -0700 (PDT)
Message-ID: <1733e77b-8bc5-4c64-92a9-6f0c36f7d35c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 11:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Cleanup ath12k_firmware_mode
 enumeration
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JxYWt1ljC3aULFprmaQqn6b7zAQ_InwA
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66d398 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=G7SgPBRoAAAA:8 a=EUspDBNiAAAA:8 a=eh02q243s9NmsOQtZLkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=2rYB-OeQH5pmQqQB7sEg:22
X-Proofpoint-GUID: JxYWt1ljC3aULFprmaQqn6b7zAQ_InwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzMyBTYWx0ZWRfX7tyGl9U9p0uw
 ifoeL16fmXr1r1UMUNH06NR+u9mnU6WRmbSgkH2ZbD2IexJj1Z7sA5h9C5RUSQJep24GirRoWU+
 FH5C0NMuMAO02y27hhIk4hapYPbvYrkaTrXXkve5G6C/NiPEiRNbjObyicviyXwZS98Z5zABuix
 DWp9sh/XeFEDlP17kNHD1f1TGGf5JcJfCyWubcGl1YnQJM8WMBwZuR24qBT8/VZBjFK1NTtSHr9
 oYjJlSQ6JBpHLCi6qImDLqTNTT71t9e+Qn1GYxA8EbYjgP37JqLGRIlHv51o+R4QO17ogFBHq5Q
 zzntupW8frVQEVyNK/KU3Rpzq7n1W5ciVJKGPDIYAEt8sX9OrVDh0PBSjQG4WbOccFKFTmo/oH1
 wcfEBqa2ft9TGHuQe5leWS+FmiQd2SdMTU0JZ5/FRqVwaJuPQw/s+09RMKVIcKmBo2d2w5KMd+e
 RXUnI7TRCR9r4W5qxdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzMyBTYWx0ZWRfX5iZW9JjhisC/
 S4usJg9d2H9V9XqMvWgGmsfjaHxXEH4NGki0FDmM+NBFQ9XTgAkG7wisCQAYoBYCd6oRwkLIEp+
 MEhQ3NaxPS8nRpF41oYvgb+XgC0FmCQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_204217_604380_29F816ED 
X-CRM114-Status: GOOD (  10.22  )
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



On 7/26/2026 2:11 AM, Jeff Johnson wrote:
> This series inspired by [1] for ath11k, but takes a more comprehensive
> approach.
> 
> [1] https://lore.kernel.org/all/TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: move firmware_mode enum to qmi.h
>       wifi: ath12k: rename firmware_mode enum members to use QMI namespace
> 
>  drivers/net/wireless/ath/ath12k/core.c |  5 +++--
>  drivers/net/wireless/ath/ath12k/core.h | 10 +---------
>  drivers/net/wireless/ath/ath12k/mac.c  |  2 +-
>  drivers/net/wireless/ath/ath12k/pci.c  |  3 ++-
>  drivers/net/wireless/ath/ath12k/qmi.c  |  8 ++++----
>  drivers/net/wireless/ath/ath12k/qmi.h  | 14 ++++++++++++--
>  6 files changed, 23 insertions(+), 19 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260717-consolidate-firmware_mode-93c215fdb29c
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

