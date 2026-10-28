Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5477606A31A
	for <ath12k@archiver.kernel.org>; Wed, 28 Oct 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZOaBGfH+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRoUfoPb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKzMxKui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=; b=ZOaBGfH+GRPcSv
	i+h6uvFoR68j6bh6x+fZ1aSzInltUCdRfIAj+P6UB+cb+KBFzcWgfLb1ClvoElZhsVRuhGqaCJZ0T
	MjBG6boioAIbSeMRKXbAY+SUiYyeZDI1j7VKnaE5JSQlV9zUhsWindsR0+bH3cY8oNDFCfugEVkI2
	D8PSdFDgRUHMyfEFhhdOhZ3wJBU0bFf6fHaLmtOIeo/w3/GPlWqxeUQg7m9eKhJV5lmvRefNxJDG4
	U5Un1dYKgB8KQ/f9/s8wblh6ZQl/fT2arn4G5gqpmAoSvP52KPIpfbHA73nLGi38UU1r6O685xCci
	COEpEXzBW+8INvZrqR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM53W-00000007Gbl-0Khe;
	Wed, 28 Oct 2026 14:55:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM53T-00000007Gay-0rDS
	for ath12k@lists.infradead.org;
	Wed, 28 Oct 2026 14:55:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdqbh137457
	for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=; b=ZRoUfoPb2xD2dHH2
	5Ipt4+HVjNs3iEEgG+EcDE+jVtBM6CgX4YzMoXr/Ropuys5PKBPN6am/TcC44H7g
	OEekrV9gR3yl+/pUReerZx2x1OOAYyjvMeBuc5vGBayL1m1bZQLaKRp3EQ9Y3HF2
	XdFRxQIXO+NXyDukzgbx/AbD6NDrVXrOum43tpcOhrD1SC3VVGwn8R8OAWpxYsn+
	LfedsIO04wP2zFDTCBxZnd2ShTih9HyoueRYwr5SmzqUU2EOCcYJcUU5934/YCuL
	LHi1D3L/sNZ/0BY5cL3n28SAzaEEjtYeW4utjzwX7X/v9CndC2XH84Y4yNYdoqKN
	9uVG2A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9313v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 14:55:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c70349f65so24485816d6.3
        for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199305; x=1793804105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=;
        b=GKzMxKui/EhbWqFTDfF1+UqhwD6ONitm6hQOsYbGFVAHaMfC/y3aUpOo+biRogmWN2
         aVfPnuY/kbY83VXQu0i1EgVLhsqgiJNiLtwZgpn03UhjkvSPDzb3T+03pUAf9kcLOtQL
         v82XUTfB5kZdu8iaWKBZ09bPGfr4nSDcc5uNtU2DDdLqVOmmwQdR+22a2XhzqYeXZ4Cs
         oLj6nlxXWU+Y6L+tmDAzxbugPYrXBruAHrSvlszZ0dLYQ3NIoiiDAHP9CWZ8WOliPFsW
         M8WpTeDfcfQD5qH+cRcczD7fkyK1sSWGenXsKuwM6GJUdhzOOqHi8/XyBmP4yHiT44pI
         iVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199305; x=1793804105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BbfM4q1S2eDcLx5Acrn8FFVA4Ky/HliaM3KoNkQCYTA=;
        b=IPCfE/b5/5Xcy0GVhI459UiuJI14o/vsPX7MKZfhu8YjD095sBL0fx3/Nfw+4Cscym
         YO6Ed2t92njhAR8BAH6vEizimM7rcv+8jyEzTZ2dj1I/0/ciUinictedkUrtrUNuX8Yt
         GwlNumZrED2Pbdr3Qu6OHexwHYRANpikPjqgT9l4PlrDQUplatVkeEtweV6cx9481vWS
         Ehs5gwcPYr+72+79ykq7f1dbyQCGt2XaRcB/sBzwWY22n57lKPu/jCYfN5xWyFS2SkcO
         4aN1O16ezY86dU7lH02zOo9Tn7jzg9U7UbPbcmSGAr6oTwEIS0v4o5j7QsB63+IwBwJ4
         UDJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEftpoed4sVnNcG41Mh45NgqapkN5MTFXgNFV+PLKR1IkP58xCjCQj1XuSVdmYFAD4UKdlLos=@lists.infradead.org
X-Gm-Message-State: AFq9FYJtpNLYfvsAe1jH6jkE213VEerU1xFneaMAjZwr8YTWJ72EEQqd
	sMax1xY7Ogp9HAB9+vAFhe46ic3xzFlLk9Y7Mnsq/H5obYp39pErN7P0K2P1zPsfjy6pHl4c34l
	DO3fjzWEZj2JkY1c3ihP1NN8cc2yrk0IZ3SFdAAnk3t48nQERS6XphvZB3G7KNIF4
X-Gm-Gg: AYBFou1ckSQ56P2pxoSuQ6/6aDlRYdwheIAZ1aULgCvYb8WwZL63KFPRMEnJ3it/hfK
	bBYVgmX9u3p1f8eULsSL2kbW0LXHHqYQt3nlX+q59ml2woxfvJ+PLCUzYdMbnfE0NJ9xEc9F8EG
	q2aW5jA7D15agwpvOe/1gOe8LcWqK/hzNI02pXHa2+5zMNbXdz3X+7BpW4EHLHFL1+5w4Jp2j9M
	hsQEvHTJRPo4PhvSrL8wQA47dlPOGsUGrmzfRtUBeYkEndg0b05v59RgsefYB7ZHPqXS0fuJc0+
	V5gSm79SGmT96e9kb2SJlCCwAGWqDAuLsM2pCsNnZjmw0J/1IoicXbOMgnHGFPJiAfgERNJcmgB
	Fi4yTSu4ffLMg9X8QBxQWjWBaDnkRBigsw8SbAdqdHOuzH5bsiqewg54mnRunGOyA3aoQB697xN
	2JLLF7ED3uI1dk0F2dOsPqRZduZD4cmrsXRA==
X-Received: by 2002:ad4:5c6d:0:b0:91b:827d:841a with SMTP id 6a1803df08f44-91c7cfaf4bdmr38275476d6.41.1793199304813;
        Wed, 28 Oct 2026 07:55:04 -0700 (PDT)
X-Received: by 2002:ad4:5c6d:0:b0:91b:827d:841a with SMTP id 6a1803df08f44-91c7cfaf4bdmr38274756d6.41.1793199304200;
        Wed, 28 Oct 2026 07:55:04 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6bc95b66sm64155086d6.43.2026.10.28.07.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:55:03 -0700 (PDT)
Message-ID: <d7388ba1-926c-4a2c-b79b-0fcc0759d4d4@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 07:55:01 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath11k/ath12k: validate capability TLV lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261028051254.147628-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae20cca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=7uwlnTk8OcoAl1f2pbkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX1l5bndyYEtqf
 CAf0wA2f/HgEcqhSjjXk1ln11vGzBFIarbWS2osQ0M++zsv6is8hkwD0EbVbi3y6ev5XV/UCJzr
 NbUV8L8p0ujxDdLeXmkIrjioa6c3J4o=
X-Proofpoint-GUID: bfIT1jNVkN1Xj9hkEvxwNLlNiL7VZ52p
X-Proofpoint-ORIG-GUID: bfIT1jNVkN1Xj9hkEvxwNLlNiL7VZ52p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX50DNJkj4dKIa
 OKcuYXXVoUo4MaE8UCxORzVeq26MdtTVLkUaGmhrX2Lllv/dnZf/oLDX5uvbrF5wWk2sRJh1l+9
 PB3bRE45eh3Py+D6kas1puSEx6uaiQL8pg2IGartSQYTF4B9zadruxgodVaf8w7WwONl7SlNkXs
 4v1+N37uhaG0Z9BWIEgOKO0iEl0l/9e/68uP6PvWljOQj9fWVbODxaNEPRlza59/MJl4jcx4BSt
 IYqxpgLYIQLwTvFs73QNYesLRUoYyL+q1QLGmlXuuWPq2eR8A1gxJSStudXD0bGKx3WHVOICDU5
 RAhZAB7FPSmkKCvGNwPi4qeqrOoD0yUOECQqW64W04RqxMp/UY2uvAPwPPs4ArkYFwFruhzwzZ3
 0eHPy9G9J7RusXlTvfwLpttyVwIE6wKRZNGmlnTS53ILuHMoRyYVq6TWcptt0U+awMB9CCaTkzt
 A0UL9aQMIvf2hEDpEKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_075507_278484_96586AAB 
X-CRM114-Status: GOOD (  11.34  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:12 PM, Jiale Yao wrote:
> Several ath11k and ath12k WMI parsers count firmware TLVs and later
> consume them as arrays of complete capability structures.  The generic
> iterator validates that a TLV fits in its enclosing message, but these
> tags have no minimum-length policies, so a short element can still cause
> an out-of-bounds structure read.
> 
> Add policies for the DMA buffer release, hardware mode, DMA ring, and
> extended MAC/PHY capability TLVs used by these paths.
> 
> Jiale Yao (5):
>   wifi: ath11k: validate DMA buffer release TLV lengths
>   wifi: ath11k: validate hardware mode capability TLVs
>   wifi: ath11k: validate DMA ring capability TLVs
>   wifi: ath12k: validate DMA buffer release fixed TLV length
>   wifi: ath12k: validate service-ready capability TLV lengths
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 

-all codeaurora.org and quicinc.com e-mails since they no longer exist

In the future if you fix multiple drivers with one series, please send all
patches to all affected lists. Alternately, split into separate series, one
per driver.

It messes up my processing when a subset is sent to each list.

/jeff

