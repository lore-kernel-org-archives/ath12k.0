Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBE606A31C
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QRAJ0Plb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWsdR478;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JODROQFn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=; b=QRAJ0PlblcXU0Q
	P/0tUJYUXLyVanWasw3G7wOlsJY5r5IzfMdDBRbe7dqhTOcahkIIg1+kPzhUihALKDX3LGh2OIuFU
	M/2k+6UsQ3+UU+NfQxFi3uwnjJY3tbQzjT31s9PdogdOf6OTxbzgz3kfAWfuWHKvl0howmH9ArPfX
	hUaAUYd4X2Z6rhoI8ZOnX3e1v1trplgBBAtYAHE1+WlZw6E60Xak6z1D06oyVsg9abEkjFfjVMTCz
	D7j0v7ea0z1VrnqmvVZ3KzW2JFUwpUhQK6ZmLPqqOx1fH/+sfam5ibP06Dmh7u+B3PZINpmVT0Eb9
	OtWDMR7ibNoFcGz0pWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEVm-0000000H560-1irp;
	Mon, 09 Nov 2026 01:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEVj-0000000H55c-3WPh
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 01:49:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HFCi2890188
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 01:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=; b=NWsdR478VNsccUNN
	3LcQbVWJAUT7+R4ZrflKI3xEiudD7i8mwmOYdtzQYb0r26htbPglmlUPNmDyZXNJ
	WNapA2jjxmxgJscQuawPpHJKiX/DyeKLgaei78GT+wPosdEkNHqv7r0fVMa9fPb3
	i+9NY+EzaEpCBRUlC4puNizzLHGs3apyr0/yXrp0s/9nO0MOkXHJmw3Rm2x0TxQl
	PzZSpbh35R/m1m3khBvpbHEHSIwOR+wJUVcyEIXoKIk+4M+Rq/s3FvLKMprFx3OS
	QenkNQkDaWpzJ9MTwsHPaaOvGLArxI9tJy+v5xfnD0suLMxW7IU2dCk1WSeSu+Bt
	qn3y1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uc6k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 01:49:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso313127a91.1
        for <ath12k@lists.infradead.org>; Sun, 08 Nov 2026 17:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794188963; x=1794793763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=;
        b=JODROQFn+oP1bl3KK/DAp/jj0qLtmXDTND1nkLjfDgP2pvbu3UDOnuobv2Ap/Vv2rq
         bqDTkUaYKcv4EDb2+pK3jbi7MUTjf9/DjjqjeSFMMCMVEJoltcRUr2DSfDRvPlFiCdyd
         ff09/D41ZU2US2VUpKx0uPn2wa+MakdP+WcJ/+iNwi1GAePliK8rS7yq+i5KODpB6WDj
         G3PUx7+6dtNFGNRZmqExWfi8aS5WF8sqjGLO2QPnRrAneaaidLfUdtRVqtHaaW/PnXud
         ABXu2LKor3ZRiNioktSD+/eLSlGk3muf/O4x8asyYx4clST+9lIJNg++aK//5Ol9Aifs
         X0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794188963; x=1794793763;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1z5wY7a1tQmiguKtPm1FwzbgJ6vGESqZ19Bu/J3ZMM=;
        b=KKi6N2FHexxtJqE6izYXx0GTznuZU5K42mRA3+vaq2xXcTKuSM/waFqAuipgRnj5D+
         oL6HrAdFDySUhQu2EzozoiuF70h4R2zEEPTt45O0th8JRXdTInBC7bPcH4D2lIoBYDUv
         3Qim5kTTGUCQQueeII+jw/m99VoYUFi04iYiVeM1Nj5B9bGhGkRexeYpv5TqrzpFiBHI
         koMt+4sF0FcniVGr1NCw3uXhUeIx0oPd3Gu71wSyWuhi3/ufdE0cOIsaA0oxubuHqW6u
         i0JWWidOmqLOgnoODIaROeKnKcnf7D5sAme4ekR2sH4GWwxQlxXLFulOmyc5+ap0R2BP
         Ke2w==
X-Forwarded-Encrypted: i=1; AL+hErEgbF/L0L5b4SpYaEdc+kd7DbQb8wy//JCVEoxcHfh1hUHYCBwImazZkeWpmNJ5C4bBN6boI7A=@lists.infradead.org
X-Gm-Message-State: APuU4Z96Jb7AG3cVv3m2dXIQC+09f2/DNR8G4W9EcHVHIxxzh8Mi5oNY
	TPvDbPidw1Ny7okLdPgQMtEIAlPkTFcs2P04hg3rV9exodG/HBOnfvrqiYeGnArlNPCi3GHX54u
	H/v3796zz19Xy2Z2G7TnnPXq6I/rX4nJSJBdsGSKIMt8/ah/vP0st2p0o53Jnd6u6/Ud6GUJC8I
	M=
X-Gm-Gg: AYBFou0Vq+6+povWn6uLy7hcXptLq/B4IzbZDuUxDzRvFOsx5pggHtO5+L/ssATUjQA
	Y4fch/6uiefFGnCKgRFjFPqfDBbYrl+hoWJYTzZFeVEQDhu3o6daZiP5We7mNpE7DmuLAm7nPOC
	rKrSlOoD2SN9x4Ss4nF6lB+BV9hEQFMnQ1RgcsdQvTGkFOxciJQbLTB4OzRp7sHVDriRsNHgHBC
	5eo7vfd4shWe7kYE5F+8NukhXkdsRKWV5UAJBJCFmOWfmXMaIoKukKv00gO2YUb9qwcyYEhajTr
	2fSxuGmspEaJMtm26ILTntxTr0R4ZHAfuZvdM6GWXfQX9ty6+Cd1B2e/RgWIFWfCnvnS+G1G9dS
	E0Jmd2Q0socWFBhCRqtJgndB7BryJOkidBW9uuY1k2UcLrGg6TYFkzmg9oaBqucXcJN8EoRe3Hh
	iBif0=
X-Received: by 2002:a17:90b:3889:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b12d5c3df6mr1800182a91.40.1794188963482;
        Sun, 08 Nov 2026 17:49:23 -0800 (PST)
X-Received: by 2002:a17:90b:3889:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b12d5c3df6mr1800152a91.40.1794188962934;
        Sun, 08 Nov 2026 17:49:22 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc487e05sm5296034a91.1.2026.11.08.17.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:49:22 -0800 (PST)
Message-ID: <aab38321-5a63-44f6-90ca-f63be35aaa5d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:49:19 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove duplicate ucast_ra_only
 assignment in dp_peer_create
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106111032.3157318-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kt8ohkZYTXp7ExvDh4pTLu--B5GOQCdd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNiBTYWx0ZWRfX8J/KpVOW7fU8
 brSfsSSQ4oKryEtIkilO5Io+/dgn9JT00223+SHjpEA8j1kHp8KpIpsTmXxWUeN2/PCLYhKCNI9
 Em1ZzDO52/I+3qViWRsvIClyRRUDWFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNiBTYWx0ZWRfX6zLJNhgOJteB
 eTSlqkdZL/+Gk/PKq/fSADsuBQxWcjj5LliPT2++/8nLNPldGdtz7j5lVJMIdm02M4kI2obfnz2
 80kXUhtgsxiN5HsU68RHCRNca+wXzlS+CogeBRXDr9vsmSA5dL1D+ipXBKPjoqPVKRUzg9su7fK
 o8EI0fqwUA48NcVQGmwScpCfpT7LxCT0JHD1Un5UbW7R8gOkyRARb8qtPZNq7o9UmpK3vNlYTYI
 0TPjZ8Od/QNEqWqzLFd7JJVaH+VRWHAdKW5hKTTuBqT14BrVimNGoR/7uKZhgPPGGx+QiuvSkVR
 mVG51gs3w7hi/Ukmf7lCHqXpbbVU3qthkDeWwlc8DGo0teaI94JRlZKWeirAID8KMyR90OzJz2D
 oQUd7BCaCSmJx1UDGLLVmtJvL9LhvJzZG4YTe9V3MTiM1DK0xeqBZsV11tDqzMTOWFEq+91JVxk
 puwPqyN7GZjjaKCVJhw==
X-Proofpoint-GUID: kt8ohkZYTXp7ExvDh4pTLu--B5GOQCdd
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af126a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-Mx7KV1jT1rGfaPvk4kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_174928_006681_8703AE6F 
X-CRM114-Status: GOOD (  12.06  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 7:10 PM, Aishwarya R wrote:
> dp_peer->ucast_ra_only is assigned twice from params->ucast_ra_only
> in ath12k_dp_peer_create(). Remove the redundant second assignment.
> 
> No functional change.
> 
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_peer.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
> index bb5341b4251a..c9075883f976 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_peer.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
> @@ -486,7 +486,6 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
>  
>  	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
>  	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
> -	dp_peer->ucast_ra_only = params->ucast_ra_only;
>  
>  	spin_lock_bh(&dp_hw->peer_lock);
> 
> base-commit: b9acb873d035fccc8824164246535ea6fc95c71a 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

