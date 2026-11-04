Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6217606A32D
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 02:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wIlSviRt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DBCtrizy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f0FD0XoS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=; b=wIlSviRtOZMnkA
	9Q0NNZluwnWb/EH3VdI22yvRUptUI0vkn2k1K4HmPK/xFeAEzrWrw9WWFcujGSHgnBJSDBeyBxxbo
	RmOrOzs/W7vPUbqs/sTf0DYiXFOfyp9weH0NtuBUvSzbum1cPOJT6J9iqxSIEMhZqiom8oHhRaCvG
	9BsWI6T4MJOjK+qlQDY4GxXIbhrNOMwZHRJ36MqBda8v7Y7FA4IzG3JacAlPL5p728B5lTW+CnHHD
	/wx1JBLN40rqfQuSrcpMBWrViYdGBFtSXaszXZNwEl6AyNv5UOWtxeTyckvoQQVnIsfVzdwE3zX+D
	jncPGEpq6fePz0sgjIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQKm-00000004749-36xC;
	Wed, 04 Nov 2026 02:02:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQKk-0000000473Q-21Pm
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 02:02:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R1pE3458487
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 02:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=; b=DBCtrizyk7dRQcIa
	g/gOru9rbw3+nT+/G6I9DUmyBcS5kkTXOh/Fzir4LPv1ihThiAHTPM2i3kQUYxo5
	OZi/Mx1M7ZkJANh+CvNJIDVSeUO6T7wwpkUMphEPntHSoypOiiIZUKBbzJ4ql4L8
	X5DjOkGbPv4oHZT3TMFuVDpFO54AUsHA4pU+gqnFOVsRTr5W97yyoGRWuhcVf7rf
	ZAPTmpVPykmHBSCecHL+TIEj5Kom0olIVs0CBpZd7+XhJEryUxlIV+KxfA0IYEra
	7u0UFZe4Arrg6q6OE30A50zewiIYdX8P3uJL9PQYSU4NkxUGYleCdS2BRvTuKggB
	DiMGCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2btrsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 02:02:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso226264a91.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 18:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793757757; x=1794362557; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=;
        b=f0FD0XoS/DYyrB7G85ne+gOXND2vQ5JO8ukUgubvmfjQs1YpW0wxAsSlHYBJdIWnNb
         IEuSHj5G63UIryqQCynDnk9d/55dy9h8Y8oEDBIE8vND8lZ442T0jqISDSD7h/MLkuTT
         TzKE1uWzIlFSlgjxZNlnMX89tPszMDstOuatz1HhNnH6rskzokv/7Ae8rCsqCbBq2o/W
         iVYl0iL5pHoK6ysCZ/NjzRt/dEwo1G7BbWt4P65uZkaoHjdoodjQjG9SYI2bfyN/Vlfp
         lbXr2idUa1ALCyob3hsJwOoUwPPGdrU4jJsWZL4IP6/vi8fc6Qt4cnYxaryU+Y/0WTTn
         mbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757757; x=1794362557;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=;
        b=kC8ZrGekAFfcFVAvMprq71MT9DZTUYIIlExiYmbLCaioTYJjvaj2d39EWTc/Z2cRTG
         +dM6BP46A30ReFc/YEs79mqk/8KJ8btDQCBiMTupatdXoJN8uthV+pXTybc8HC6zo0+0
         fwx3OD1z/F4h4IHiAlMIkc76HrkuhBAAeY3GXOyJUS9/TXfR0+CBXhmqbZUcgi1runj2
         i41/t3Vy+Ue18xJIWCcun13Hp4tspkXlGe1m8wUGWC6uFOOECzmn3efzqIn97bvHFFnt
         unF24RVsdrtZyH5bU6PuMlMqQfMOoC3x5k9xwOULk0wp66oeKloYJhPSmnE6A5eKnqcS
         Lbug==
X-Forwarded-Encrypted: i=1; AKwUvBwVzDJGo0ltVW3+p5n8eG8hAubZtEc49P2svnlPXCzSHWuxTK2vTsnIX4/FRafmeJVbg7Ppb4U=@lists.infradead.org
X-Gm-Message-State: APuU4Z/2kukImUFvAthdGJTRzjit0pecm1ax8ZPhLyNKjeAkm4BBdzTX
	CPsZon8QowkFpgR1vJ55ZdYXHQ0lryB3WzqOn0AJWbqupJL2ckqNiIV+0GcEMUL+fv3h5Yljm90
	IbqH6Kp5XxT2xKKt/URc65osgGpIX9wmn5+Y1QDJ5BwLet4WHPDmpJA9IUQmc7DVlorrm1Oe1
X-Gm-Gg: AYBFou3yO7fAvDBBZeqwg8B9MaR2tvNbXry1GDkiiYYm6okYjcbieeUvkz9nws8n/Tp
	bxG0lHceFhWTZCO4+1adS0fpYO+lyl68z5GRWlrQRO0XtJNLwbbWRGzakJDmt3Uk8dBFYfM/Yfx
	LqJUpuA+fSPp8bGto+4mFYQvH+vka5MY/wa80JQrw7qvPNG+HaXIHAo/leCNqT0sTGziQhAiqTh
	JVC7UkTatWJ84w7LQWjmxSZZgR1IyWpJz0ST8tem0+OnhML8fHfLI1cEc/QvH0zTIrvxlwAPaWK
	TzMczxZe54zvCL/GsjEsTUsipT8LkgzkDt/iQS2ah2mS+gybBFeTnO6BL1Nd50BvjifCR7ZknF5
	MFSJHzOB9JcHREuu9DZozLmTOI5IeTBunuda3t2Snpz8328JJUdtHeoHoLpvJYT09VZAr1jkId/
	5SmDSMaZ+jFECjFhs3uoIwQ4POxRdjH3HMdJxHOPbDvfeH
X-Received: by 2002:a17:90a:8398:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b0998422c1mr266153a91.11.1793757757166;
        Tue, 03 Nov 2026 18:02:37 -0800 (PST)
X-Received: by 2002:a17:90a:8398:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b0998422c1mr266144a91.11.1793757756626;
        Tue, 03 Nov 2026 18:02:36 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm6947487a91.15.2026.11.03.18.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:02:36 -0800 (PST)
Message-ID: <7d07b4b7-42f2-4367-b3f2-aa2ce5258747@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:02:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: refactor m3 and aux_uc
 firmware memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
 <20261103-m3_and_aux_ucode-v1-2-e14f13fdfa41@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-m3_and_aux_ucode-v1-2-e14f13fdfa41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXwbxIgjcHudLH
 vzZBjwjqB/9mvPgziR8iYD0JgksadAhMdlBUkOCgqUMmNHiXYlDtReWlmSsaLJXRtCRPDBU3WGd
 IMXwFe+Acp8F39pzvtjLE812fY7D8mE=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea923d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=j5APcU90v0LWm_mwTeIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Fp6d-PbvNuoC6GCBuMKfwrzXYn5HxA80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfX0HMAibjscrSy
 bdP52Hkc/x5B+uZ1yIUVSqzR5rUF55r9f5Qk3LU1PyHjS/jzck3q9clonvfaDcSPi9ImZXfT/8N
 /2ggkCX16l5ld/r1u7THRNwxDwYtS2YCxeHPS4S/2sNwLzDXcg4BMqt3JKkUCjJHz+MYPq+j0Mj
 UPrU/XAPeLodKm7+0ApRivdyGgm5p1QEv5olHxuGpR2CkiNVLdtxIdF3pyTxY3Ch2D0wSsoHGil
 RTgB9OxdpcZSkACtXrUMtXRlXSdFlxPhz4hW/NxH4dXZjLl92nxHDdbx9QKW2gzRiSe0M78Zy7o
 XZ85irimXVOQTLnNch+l19lpj1Uyi1I0GiExZxhrbzM2c8ErB38YRMmjN03mhla1QkB94rHC1TX
 7it66INmaGcT/5YsvzXIXF6E7Y3Zf46IE998F3UUBmXlwg6CRbfSnnLJTXuwiKsGPLAX1UkIkxN
 B9uzNmc+hzLysfC00jw==
X-Proofpoint-GUID: Fp6d-PbvNuoC6GCBuMKfwrzXYn5HxA80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_180238_544092_C7D07E1C 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 1:26 AM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() implement identical
> logic for freeing a DMA-coherent firmware memory region and for
> loading firmware into it (reuse existing buffer if large enough,
> otherwise free and reallocate, falling back to a standalone firmware
> file when no embedded data is present).
> 
> Factor the common logic into ath12k_qmi_free_mem_region() and
> ath12k_qmi_fw_mem_load(), and have the m3 and aux_uc wrappers call
> into them with the appropriate struct ath12k_fw_mem_region and
> firmware file name. The shared free helper also clears paddr, which
> the previous per-region implementations missed.

I don't see that paddr is cleared in ath12k_qmi_free_mem_region()

