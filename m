Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E807C531FC
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 05:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNiOmlsCm+nfCb70/oElfZ8sq7jZl++puhIth6cHpd0=; b=P7IjE2z9lG5FcJPS9nWK2wasCD
	z/hi79P4iyApN0U85w7k05HM74m6gHEQVfy08uFKtWwUdoYP0YW/sgTEBHX1UvbcxQ9p8+XafO+lp
	veKaJnn6JRW+uCaNeOqn4EB6C8qNFDEsyMsDzX5kzSM99rodBDJg5Ks2ICAc9/+yVxygmQ21fJnMo
	2Ousg24kxC3y8iDYVvPI2/cxWvEdQrRAZpl/QVd8wTDtd2xHzWrLcXOlZjZTlTpqb+0qK98ydLK/0
	y/JeQp3xGL/IH+/FSkCEVt+sL8BsYxcUHEZQbPL/i3ixC0Cbu8atr9AVuZh4EE9QHEePzkNQxPB8N
	yOZu1KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDrE-00000001yEn-0PGy;
	Mon, 27 Jul 2026 05:26:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDrA-00000001yDz-23dX
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 05:26:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fcbU2004039
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNiOmlsCm+nfCb70/oElfZ8sq7jZl++puhIth6cHpd0=; b=MltfTlHcYHJxjrJG
	2z3+mEqlWOaNQTPDrzTImE7kZyEn88M2+PjnAxsjzvBdr6/lAxiBvHLIoUaWfRDF
	VDK09WqJwdhlrkW5qnG/osZCGlFD7n98JSLxQN1LA5ziy+rH3y75TRXxfvC89ZJi
	hTDeWWzW6nz1zem75xGIf80bnKC9VkvUQH1fOaZgt168TgBCpO5FLwtAnGakRA4N
	LIxX8ejVjDzlf/zylTwWNwzqqf4bOllgnQOTURAQ6ShEpg0w2PjY+fNX0pnc6+jE
	R+4GVq5MIj7CfF6cMzAGP7d6VznL80GFFu2+zu/k8hCrfZqKj0L3/drj0MoHj0MD
	PmWeNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpeecees-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:26:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1467988a12.3
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785129987; x=1785734787; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNiOmlsCm+nfCb70/oElfZ8sq7jZl++puhIth6cHpd0=;
        b=IR2PX2iq79PaCuluadNqxWHxU/dyX4nbEz1JiWszp412KHqrAelwu42VatEhbDt3yw
         3/bw3DAUYyPLPDvNIG82HVKRWUXw++v7vr4GvYGxwY4lmI5ZJ3REqqJXLHiTbdWS189w
         R8q87fvQTQ/Fxy+ZHb6H/31lB3jm8ROW4ezGuq2rlLwKnM/5OWpNDCWs0dx68AC7kilg
         ed2oOc0lOOIiUiOGavXW8kJ71QHXr9+kSIGbew8u+Vi5xr+wY9v3Oq2+m6rWywYXyyZw
         AO9eirdqeCBzcdfk5MNK/ZHFKhj5V9I0PN1/XiWK0jxHLfGja7geR/eoAch+kjJuaam2
         urBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129987; x=1785734787;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNiOmlsCm+nfCb70/oElfZ8sq7jZl++puhIth6cHpd0=;
        b=YvNighCGOSIA2QDUGZ/nMBxb3AQwZNOmkG6gDV0MFAsOaBr2XNWQObdMk0D8lOwgya
         QjdW/XBlDjfpFngCMRTAlMnVdmq8tZb36MKfbVbFeMKw7Qvd4IKcAWscq6jFHf0yCOmY
         SwAhgDRIUgbyR8MQoElenZCtwDVdKy9P6eSwBxE8QLWfbbqvIpe7cRCMjDxRNpbVR0fh
         X1jMouMtM/z332BOr6l24NjZPXQw3I0998K4BP/OV2q0vUTQnd38csr84RtjrgHFETYZ
         1AH1mqa+Ne7no7Gum4YCwdKc7e8inydYflhng1om4X2ic6Lmw/mkpl4ZQIBaEO+y1fZG
         cYDA==
X-Forwarded-Encrypted: i=1; AHgh+RqhMvhn6rix1QhA+bWObdNTXRcO2IdZ1AhVoiAApQNEoLVQIv+To/HpV7WttWMWMth/Ljdi0AU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ruy1RqJz782yONOh9EOwpA3GxZkf83G3QhU+6aplFCb9rNdD
	mCYIb+cyUC4Nt8JkVEw6vtoRlfkOtxtgNkMLym6+5j+k7R/2r9vAy5JCeJWzOS+mhJ2nZgiR03j
	g3ExDQh6ChhNuDUzeEj7K969JVC392+nQuEFGbVj98KuKlqGqbN12Ri5HiOSbCQ7td8MZFtQH
X-Gm-Gg: AR+sD11cKO+L+w8+bgT7q1RbmfeR5wiXagMiQzZJJyyC8yvH3JEvyN1EewiyY8i8FBb
	hXmFg5zfPKNpGjxQHRHhyGJ56AmZmEGp8RBkLUgARzvIbTyJ2mPOlNqfCrw8hkNRD80CezWw/cx
	uAdjQuIPRNqZanI99JX9d+7W3XY6ELJ6Hi90El45wbwztuYz6C99mgjT6UL/BdjdcBtI3bFq+k1
	s4y7fzE9yWrQol5+BRWw523eOmy6C20Lu6vhviO0HWX35se6xUYG+ZCqHfrqmDoI8Kie1rrDTuy
	cawrSjM9qIG2z3WUcFieY0TGP1cO09CQa0avzktcBOdsao+EnrIQfQLcmjLM3rRypFYA4seiNLv
	sob9pW0C5dsDP+B6Q3TCmClZelWD4ioMSe7Y3SAzQ
X-Received: by 2002:a05:6a20:db95:b0:3c3:a529:1e44 with SMTP id adf61e73a8af0-3c67df58a6cmr6360562637.57.1785129987343;
        Sun, 26 Jul 2026 22:26:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:db95:b0:3c3:a529:1e44 with SMTP id adf61e73a8af0-3c67df58a6cmr6360550637.57.1785129986947;
        Sun, 26 Jul 2026 22:26:26 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc447f6bsm30949947eec.12.2026.07.26.22.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:26:26 -0700 (PDT)
Message-ID: <8825226f-91b2-4b7d-883c-7cc8e732a167@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:56:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Cleanup ath12k_firmware_mode
 enumeration
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260725-consolidate-firmware_mode-v1-0-aedff0ce0ba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jr3Bas4C c=1 sm=1 tr=0 ts=6a66ec04 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=G7SgPBRoAAAA:8 a=EUspDBNiAAAA:8 a=NlHsPbxmrbyDciBibFUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=2rYB-OeQH5pmQqQB7sEg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfX39TZkzzSRsWU
 UoNDuENGm/rbPYFbllvsYoKo7e28WK2aomhSXDanHXwgNahLdMj0LgCaP/VbkCD4k/hdP3IGXlk
 UufXvbA/bOPnaOo3IPbdVsf2DLRpoEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfXyJF10j5d2xpu
 A31wp4VRSioRcr2o0IVPECiZM+wva0p9R496zjpGGrDhDWXBhUAiJwj3zHONX4CvnRRL+wlNVSn
 OdWJT5CLEAzK97JwHiWlCHgUXmgoNCqZHSd3LqSkPIUHT/Z1NEIHNOA0MdlEA5dE0ZdavuRXyZ4
 8JLE/CyYfx5tP0fDRcXYX19wiR4LiJtOGOc4lik8GboAYw781h9Coitjg3s4gUExX8Z1yfMTzY4
 stadKFlfJePdrT301xQFkgdzMiiCodOjunvQUhBD9vQ59mzgU3AKyAWa+Z+44Ill7LiJL7/LJjy
 v/wVSvli4dIBUFn0S3FR7pv3YO3jL1jsq8r/JWgdq9LNy8I6V3MBM1h05YDuBCyrPNl4i3aUuHm
 zQNgK2ZufnS7lkxY7n+qKAOQ3bk5pNVunxpf4uI/B10waJZjKa9XkG+L8tMy85dTSztxlDq2t6Q
 3iAAJrwy1hrEpAjRT1Q==
X-Proofpoint-ORIG-GUID: h1PFQWmFwjnlA63q15bQ46y9Xx0Xqp2k
X-Proofpoint-GUID: h1PFQWmFwjnlA63q15bQ46y9Xx0Xqp2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_222629_058109_418BF1F6 
X-CRM114-Status: GOOD (  10.81  )
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

On 7/25/2026 11:41 PM, Jeff Johnson wrote:
> This series inspired by [1] for ath11k, but takes a more comprehensive
> approach.
> 
> [1] https://lore.kernel.org/all/TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com/
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: move firmware_mode enum to qmi.h
>        wifi: ath12k: rename firmware_mode enum members to use QMI namespace
> 
>   drivers/net/wireless/ath/ath12k/core.c |  5 +++--
>   drivers/net/wireless/ath/ath12k/core.h | 10 +---------
>   drivers/net/wireless/ath/ath12k/mac.c  |  2 +-
>   drivers/net/wireless/ath/ath12k/pci.c  |  3 ++-
>   drivers/net/wireless/ath/ath12k/qmi.c  |  8 ++++----
>   drivers/net/wireless/ath/ath12k/qmi.h  | 14 ++++++++++++--
>   6 files changed, 23 insertions(+), 19 deletions(-)
> ---
> base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
> change-id: 20260717-consolidate-firmware_mode-93c215fdb29c
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

