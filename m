Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0A606A31A
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4XrsHDiR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E9Afo9DA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TY5/p6cb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cqkqY1y9HuDExVdKYbZx0vPUsrpuqxqANSFJ6jeRl+8=; b=4XrsHDiRGoQUIWl+ARC3e3b6x6
	jiaEUFa+sspBFp4D4NBLzHM+8Blc2V0zM8379XP+fE8c48LwW6NY7za7k1VQDv1Gk0UpHQUY2DL7o
	ScDWPdpRw4ACUlsIoKwdeN4S+kgFvp3KTtNhdg00xK8zpEtca7LLEX48vrw41OStcQMXMBd9HqQyC
	ptfxj1K77ivDyKfVGCqX+NDRdj786vhEX2OYrhktbRK6RD8xRag8+XRBMzCf0OziUThzYONq2oz+J
	12tCcbCsRr8zuBSpqB2ToaDnbSfTebizt97E1xEexXHrzlMxrGXM0GadNn5oQmf0KdXwCoOROjz03
	wNNzwAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEZv-0000000GJ30-42fA;
	Fri, 23 Oct 2026 12:40:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEZt-0000000GJ2d-1DHx
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 12:40:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAQA41597889
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 12:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cqkqY1y9HuDExVdKYbZx0vPU
	srpuqxqANSFJ6jeRl+8=; b=E9Afo9DA5pCfEYGeinsqRTMYWR97o8d6zvGJHg29
	Mz75jOipb1r+rCdgbUtm7+4ceUUQtgcTEBuZfxYRtOvruMMzOzOMaJCg3zWCiGa2
	voBlyfRJeCYxh2fdGQQO1//MH/N310VIDgGsDsJTovOhpOFABmAQB/nJoCCkB8RD
	uhIuqZXpkKjmDEknNnAgaSu8R2GFM516jRQfgv/LpkjiYoNMb8yi3flKGNsomvbn
	NvprdTccKxarUEa9a23HvFRI7BSN+9x2GRV2oA7dRkbOpL+pMbaxuC5MZsY7xGyd
	YWXJnRl3hhR6xyPAaP9i5EseSw8MQuqXJqhHBlUndjS57w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3ngy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 12:40:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so146808585a.3
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759256; x=1793364056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqkqY1y9HuDExVdKYbZx0vPUsrpuqxqANSFJ6jeRl+8=;
        b=TY5/p6cbT6u2Mi4fvZnPKyqhVAzAQOPZDgFounK2fsLAfNTxXr6lllnHGMoPI2xqw/
         tIzm/FFdKrTLAZadftQkyFLSFP7gF3ymd71kE8brpUIdRiIvVZzVqiMZHDwyiity/xjg
         iS8a1Sn4MtJddLspa1fCV0GvWfiBv6GL+Bu6hES9bg8urO4KEABEcSXVVW3xH7ax2r6F
         8oBsiZWLgPCPr0uyNFGCAOXhriGLU4dsTdG4Lzhkhx5EP21hCByLYQ/+cWAEb2Gvkn/v
         +Dhde9yXRFQJsWOal/YHXgRoV3Rdn5bB1CXxawMze5Os9gMpcCpfsPPrRdbbh+v7Gyoo
         GxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759256; x=1793364056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqkqY1y9HuDExVdKYbZx0vPUsrpuqxqANSFJ6jeRl+8=;
        b=X2ASyYdtR++Z9IBTBDqsaj2oqFyJtYhR7VJt1okjxsg163BSNM6Qr9R2E3ERypiAaH
         yN+oIA3aCdckZXg+7CxoTku/Ln5ANxNekok4k651B8/muISLeQLS0T8uDh1hDkYCsJPU
         k8Jf96YC7n1rWqJTNhsZvvnbyILa38ENEgORL9WDrPijpMtI8Rxq6Pt3ZDaFyLiNmB7s
         NKik+tL883gLq+OlDauCI7JYu0Wn6SVjHKcriKbknrS32y2iWZQQpqza2P2x17J4e602
         LYsQOsjrlEfOvUNEDybng4yGdbcmwnfrRlLnG5LtJANuN+7e6hyAlxqCh4YxuJu+0UOr
         cyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjWE9Ue9gmPuYh947S9jbwnH/MOc6Wmq7Wug0QvGmAtQi+w2K6J3zzcfwCXHk01bjRMkOmrmY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKZGcptnKQ14NTkzjkvQVc/VKek4e0Six2PIldflpSWItMiTnWx
	W/h9fOSHtOG5q7pS+xPWJ8/kqhCUxcFZQo1jM5cD1DhaKUoux5TClceDtNCCS/YbU/WFB6W2zix
	Zq8yngLU+SXuABhfyV22qc7IAwNwC8P0sZcMBWVnPkAcfrxBKyrz/3Co9wJDH6Xu9VgzrNK8z
X-Gm-Gg: AYBFou2COIeUuosnHltDXReemLX4zMDdp2uZLCJhqhSbOPkpQhqvH23suihmtLSRiZc
	IKS+UtEkI1vkmPZco8m0IZ4GaLRFrMcDyHm8WHDyT3u0a4e64frFivvv4/CYVwA+oMmvkdLx/I0
	W2GB0wfgDHO4zV01lqXOpYi/BzQImyoaGmzK02w4BtUyWvMTAs/GZc2JxwZQAgsWNezWXNbujvn
	m3JkB2wfE4HeTdCP4MWO1wjEHktjbL2hIuG32e/9AcQwqnIOvOjSaECYhFIrfNPQUmDLf3FsG2F
	cXDU0NbP1tQuq2p9y7+OIHl7zjO4j/7DEZwciiAhvrdT8gQg5iQcQi43GHULp648YjbqdOavrlC
	trvZbx8tR3MDGDC48Wxa9X1xugEytjEWIIq1SFY1SNjMui84T
X-Received: by 2002:a05:620a:4490:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93f6f91a39dmr367481185a.19.1792759255659;
        Fri, 23 Oct 2026 05:40:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93f6f91a39dmr367475685a.19.1792759255034;
        Fri, 23 Oct 2026 05:40:55 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804cbd1sm4881269f8f.39.2026.10.23.05.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:40:53 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:40:53 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
Message-ID: <attV1TkT-pGiU-ZT@lore-desk>
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com>
 <2467a07c-e215-4cfa-82ac-22214a144dae@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zIoI+Sq/aIvOtaD/"
Content-Disposition: inline
In-Reply-To: <2467a07c-e215-4cfa-82ac-22214a144dae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX6s6iRN7fXwHJ
 5qaShPUvnvbEVPiELSLvcQ3XNDkvg37Jwojcu2MYdLy0nHF2wBqmWvVqSyXlbOgW5kQ5rcXaD6x
 XTiAkrLzfYrWsAKZEZeNA2/3JK4YuFyd60vMtagDeIKXkBoKQd+feuSpsDpjKJrsh2Jkrv9ijvD
 U1rBHRdooSjGjOicHW5k8rKW/y7w0QNSCrAKyqr/Xs5jowmy+mCUDHB0MfHGw34h+w/2eoGaGAT
 S1calUoIRGujENVM0bY7YC+iSMoRqcmzc9+NsOcSoMobOey1zk9FbxJHu4hOo7655+P80uI5acR
 egbM00WctcV0wxyU+XKjhgx5dBvh3MKPVFX62hIIKfqCYx69ehiM3r18+BwJMd4ryChIRWz0xn4
 xwJKaHhEc3fecT5OR9u05FqSbx37tP5jDClLvd9AOXIZDb5lL4aJDuzg83q2q8nDLtixGAFf3ZR
 JGg7n0CBtdqwDpt4IUg==
X-Proofpoint-GUID: 9NiRfBwPCHqDcYpya0ay-SA3PmyCTB-a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX5UVSvEvHK+wV
 y92MRAPPOzqa0n/paptyw/uoTdh8IJzgTxtZgU+IWqooFej0TLHeD6rvoujuhi3DdQNizJkFMrR
 DbBWPaqkpP6CGK4AS10IgOEm+dOAIyg=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb55d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=UEhgMTqEtwQYctlcQgUA:9
 a=CjuIK1q_8ugA:10 a=Y_mCc7UgKoaLYVoAt08A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 9NiRfBwPCHqDcYpya0ay-SA3PmyCTB-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_054057_335926_044BDF51 
X-CRM114-Status: GOOD (  12.40  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--zIoI+Sq/aIvOtaD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> On 10/23/2026 5:25 PM, Lorenzo Bianconi wrote:
>=20
> > @@ -983,8 +980,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject=
(struct ath12k_dp *dp,
> >  	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
> >  	spin_unlock_bh(&dp->rx_desc_lock);
> >  err_unmap_dma:
> > -	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(d=
efrag_skb),
> > -			 DMA_TO_DEVICE);
> > +	ath12k_dp_unmap_rx_buf(dp, defrag_skb);
>=20
> buf_paddr has not been updated to skb_cb->paddr when we reach here. v1 has
>=20
> rxcb->paddr =3D buf_paddr;
>=20
> before jumping, so v1 is good.

Right, my bad. I will fix it in v3.

Regards,
Lorenzo

--zIoI+Sq/aIvOtaD/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCattV1QAKCRA6cBh0uS2t
rASRAP9/h1Ne68h3DFwA4hlbveqXV+DMJH1NDbXYR/ZZui957wEAsfqzec/SjqfN
XzXA9xbhpgRJyXKU7e2ZfLdvki+DPA4=
=9Eui
-----END PGP SIGNATURE-----

--zIoI+Sq/aIvOtaD/--

