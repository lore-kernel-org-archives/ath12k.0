Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B4606A31B
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DttGRe7z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JnrT8aeB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b77P3Xs7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=; b=DttGRe7zLUSlGr
	JbiiQw6PeE10yl52Vl0HbACCgEmvQRkzlTj/WRgYJolcSVOf0jjmC2NdyMzQXz0RjGeYMQxEI17yy
	utxfp00rMHiIIJXRdjS6C9db2V6YdER/gHC8G1s/8tpiZ/j+1hEqmeEaFrFYimFqkYjJd303iTbKZ
	ImvmueLDZ/V0OQU1KLw8JOGxsudFR7pL/Xmt/EA4Rr8KICicmZBk1T20arAQhv9IfLybxf7ZJNxEC
	tJpzXr4g0xNI/ifkcHo9XLbEs1R3ugvNFaj3k1d3We/caPJ7vvkSN/+zQscSUoLGEwqsjILArd5V8
	APRrLsygOwI1A59yzEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUsB-00000004Rjw-1PvX;
	Wed, 04 Nov 2026 06:53:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUs8-00000004RjU-2kew
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 06:53:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RJhG193758
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=; b=JnrT8aeBkvY2MHZJ
	ggyESnE4tBC0LAs7gD19JJW3qSkdEA8ngg6p+IR05G29hn45K3BTEh7bPj8s7Fr1
	oxb90hILLnQmYU6Ga+kbmvk7vrVmL4Eqj8OM/K4Y+IUAXvL6wglWZgnyqFKumfHl
	VqdjwUXMErhHP1QCV/RRjstfD1QiGUqOo2ICBL1lIQSSJrso/7f6a8CdaD6g8Ho9
	FZd0eFRtwbaHwNNIbSvwPLTTq41Yz9qq4oMCe3IRd7uG3lCZa2Ph6cis1362xK8R
	NwlyZZa03NNapZz/CZXTxdUJGQ+MDkd8MZ2CcjbMKxaohe2B/S3J/9n/8WjW3nDz
	heI+uA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njegc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 06:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb00825063so11011935ad.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 22:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793775203; x=1794380003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=;
        b=b77P3Xs707klaxJXWlhMh8/FDGcqFC4NQ/bXpKhdXrLQI5fZA3hTKAv8uRydXrJoId
         csmBdOpNpjHPutN0yhJ8vfa54lH3DDb31EBC7aifijA+eFg8bo1ahwrH5qTDSEzsh3V0
         blV9bVmK1/wjHmBwSRk58gp8iJ/UgzM1MXD33FhhI0B948se+6DOQ9o+vnQCK8CFXFwB
         g9r8wKLXpgdMCzeB65rX8cJpAsypiPX6jJLmNWPR+Lp5bRS6F8tlPab8s9DygQVnxvBz
         QbP2OIlgMt346DJaFAKP9GxFapjKK47PwGKQkhDdpwPzi2YUakAtVjgRoTXK5d75TSJs
         uPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793775203; x=1794380003;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAsP3vEcsMK2Pyfp7DECuhtXhrSBH3wv4vtWNL9Hj1U=;
        b=bqIo20L7NiLC9mg1mgja4477MAU3RZMyjs9mf3toT52T5evNWIrgbykXQ01hVu0WQf
         p5Qh7ftODJwRWqfahd9uH48AqTzCnAz2bQUVHZl8ekLwI6R0M254tpOMsfKNstSBfnP1
         IXcJtG1OJwFPhxBbpT6J9nRxmb6tBhPrjeWgm+O3i8ejS+WY6qY4XeaB03gLeAm4nXsE
         GplouEbzXugjD8jQBldQuAlurMG5AGyq7Ofu6bbR+W9UPJ8FPTtbsRSlcSLfMhkz9DRh
         gXvfLV0j0Zsp4DndzuA6Tn/lb9dQeZOZYKdV9bR6Kg0H8G6Ez+EuhztUJyRHkZVxgLZU
         VDtQ==
X-Forwarded-Encrypted: i=1; AKwUvBz218OckWjVG2nT4uy7dwlFo/VqygOfSbSfMcXm+0a+oa4zbxsFUy4kmCgD0lheA2U34eX6uaI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9yQq4VA0rhf5hjo2mzJgyMPaqgocwkdgeqh+hz2CoCeTk3tzEK
	Rd5SV44shcj/eLu0jvkMvW4Qt3cR6+M+t/jgiKoMGWOHjBWTCOTNp0lP2jpltlfPK8CCLe8hV/Z
	u0dEk5OJTplXZ8fq5kEBOYoniwyq/9c1O52k8BpzFFYyslET+QSa9kNSJR5+IJYz7Kuq5kQv3
X-Gm-Gg: AYBFou3nJz1i/7I/GjQsAX/c2sad5CWc9SIIJ7LL65Ha+pxB0tjAXiTv+ssTtyDn8+l
	qgaEEP68X3+yURNsOd6bYcxIfE2wptGfdJi0Fdw9Oc8sN6o9HZK+H7orDKjS19hWADhEK43YaKd
	1AfkwiQS4Gn08DKyFWz+64Civ+K5mtJsUtKzKwQ7MHB0UY4buw/yWGVmpDnxTZU0FJdglptgG7Q
	3yqAK/pmc0acU2BF6Ef4Cz3Qv/MRecVrXA3WmF1EIAXkbekf3BS9qiJnMm2KpSQeZWATTaeArHJ
	cV/lpUcS4I3Fx9c5znXO+djkFEXd6QnCmsSuf6MHAMmWkOJHfZZPu0Bmcxn9CIciMcLhPbvzxE+
	pIMWAu8m7hkpTTek1V3SY27BmQ5s3dra6w2SXUs+6vRl6W0eAZfseRNzkgkV9jHKQtSmMrCybSl
	jK39oGhSKaeLjD+tSHrRW1odvy/Q27qCFx6w3dq9gNTFQ=
X-Received: by 2002:a17:903:1aa5:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2eb364961c8mr99565685ad.10.1793775203204;
        Tue, 03 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:903:1aa5:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2eb364961c8mr99565615ad.10.1793775202770;
        Tue, 03 Nov 2026 22:53:22 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090724d1sm3471465ad.35.2026.11.03.22.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 22:53:21 -0800 (PST)
Message-ID: <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:53:18 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyNyBTYWx0ZWRfX/0TIqWLMHJ99
 7K7fyLB3NCpq6N3jCQvFjQN9bCMaloJuMpRmug6QhDaeayRch9iX6zpSSkqPJUfr12NSmD7xge3
 rJEy//xppSBrfHc/4MG2w2C+cDvwl2cYGwG7BeuiKXIIOrLKVZ73/5QtMchyIAqsYg3kLbaZ2ln
 J7Ga4xrb76SYsKvVUu4E8OalLdK5LtD47bm4WTi6EzvgrWnLDYLcqyw7ptYHauGKBkG7FmeA0ug
 Gx6VnPK52tMMTdbA5NVW/AXO/pN2C1baGDz0k/sssq/8FkAykw/V+TQ42gBDVpAlwEMM67H/6Mu
 CwLe1c6vCy0mWv0D0UlKQwSIVxQ2YObDGNlXBbX5Zwv822ClWPDOZCUxNQYiYo4V5LXdawl1zI2
 a+6o0fXnjCnvEbcXWENoIaHJTVw/3XfHxdrycGjOEVXlY+A14iqJn29vkqOAZKEWW55R3+3Ujdw
 ayzy44mrSQtBWyYMhlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyNyBTYWx0ZWRfX1+m7uGZI/3Es
 py9cEZtsEKyMWfbnY+rQBe+KJ1OTfmyoRgYl2j6Sufj4GWxXKlTBs7o43Hvu3XlulC/syi/7Nza
 EU4ZTh0pwCB9YXYB2GEyIb9XrFECUEM=
X-Proofpoint-GUID: xYsmwxvgCDUaUFs3wuwVv_kBdAz6rTVC
X-Proofpoint-ORIG-GUID: xYsmwxvgCDUaUFs3wuwVv_kBdAz6rTVC
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aead663 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_225324_710904_1D7AFA84 
X-CRM114-Status: GOOD (  13.73  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Changes in v2:
> - Addressed the review comments.

this is not enough: you need to clearly state what are changed in each patch.

And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
this post? I don't see any major difference between this and the previous revision.

