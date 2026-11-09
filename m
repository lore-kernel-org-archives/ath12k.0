Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D160A2616
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGQleV/s;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eURiKT3H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvyxwmXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=; b=YGQleV/sz3klSs
	Fs2bi/CYdX9czQ30w+FIozb4oxZkbEM7Uls33kdfP6k6JisMWbP3EAkXRLRCUSh8ThB5deL7M50GZ
	oC/YiknlBPGv34Areeks7T5Qz3Mow0UvtG/DqxIQD07uGENxcOzhtIYscMrxERgUfUSLBS5UpmEAf
	XFuWsqSvLGVk+1lv12q8zPOkDrrkkAOrO6eFzM1qznwKKYLoNN14Cv7GEHLx4n2r42ArHKYwaS0xa
	bEQejIRT7RQEqKWKAPwBPy6YqtTIGTuDse/UaevXlCTXkKqud8o2bkDaA04gg4+utKMIP7Y2dFbtZ
	sTmQyFDE6myVlY5d2qWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX70-00000001nX2-1z3C;
	Mon, 09 Nov 2026 21:41:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6v-00000001nUi-3GAa
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 21:41:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAfem3975918
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 21:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=; b=eURiKT3H8WE93c3y
	RkxVynWtnTDIP/28IS77ZbpRtvhtf3v4xO9TOJBSjlLy2e8JvTYWhs+3sr7l2tYC
	fjxvgWLS5mHOjjsgdB2HHFEF0tF1/eCqgT5chvgHDC2S0j5Q87vBGz/X+DyKPS2S
	cK+4Fe4WyVahPMyRa3iZf/ygbNo3+L9KRY0pQYxdXxa/LxTdPLHAhWzpmMWbv/wZ
	w48TN7yXBTJc9g+VUPj0D47w2iTxs9H5Cz3YSIF1/PTtUwpKNPkaOl9R/GHAIs0y
	DHn7el+YOKdPPZ2+OgRlgIdAIOJHbgTKaeBZk7wCmkglOuhP9VZMt1IBO9rMygyG
	H1wmcQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8tgtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 21:41:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37390b2989bso2363439eec.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260465; x=1794865265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=VvyxwmXWDoasshDFZqQTEXtgdR8VLhgNAjyR3ZH6qMDQMcvVSzcvNvZvThbVTkaWwm
         ws02LtlgMotrgBh8ID03PfCywBuZVViyJx7rZ2HQh8OT76U8SOjMjeeOqBYCIceoIoWx
         eBDAXtUagUcSqluw8902C7vMRlifHNrIMwpEIenmqOePgSXrL/DcCxkbNEXB5q5vhiGZ
         x/peh/VCEfqOe+xO1vZRA3CkasUTvFA604PiGupSalswGYu4n4qRuTUcxuioCzlaSbNc
         O+/uJ7iB7tEUegplVz/nZI0jcL8/95IoJw49E31RiyFDPM7sO5S9Au2rrDVTP1Y4a/EE
         c4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260465; x=1794865265;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhE56GXmmRyFqy+eUTfiOJ/2uZQR2j4nz0W2QLi+boI=;
        b=O0X0Si+hVCf2AeIJAKW3R5gpF6k1F6RgncUtW7sIKb1S9qwS+fQjl5getE+7AFsc4F
         CkGe6QJHoCDi7X0d9wux9MaikB4YbyKzoPjTpIJGFGZ6YPQG3oC0kUjyZdYSFonpmSY9
         cRRfz7c5/nl7JqRymD66PCx3AjUwIxZ5/Qo44UEC95juOZXCeQFQyw4sR7NbmkOb07RI
         tXxpFws8ilfIsTLfLNp9gdnUzjg7NxbYWHtyu1pc1At8jKsoi2PlbukXSfBufki+dGBI
         N/ucu6CvfGQUIW0dRp83wdqn4wVoNBEErQvtVjKHVbXAtbxk7cCU/E4v5G8WKD21Wc1/
         qOoQ==
X-Forwarded-Encrypted: i=1; AL+hErHLp6XSF1HA6hGRLyjOyiP8kRq3v0KTKTEkD7bqeGOpH5zZP99uMJ/vL/cBO2R1hoKhVWFCuWM=@lists.infradead.org
X-Gm-Message-State: APuU4Z+8ZYF97HA99v2B0iY5M8bsFTy1kx7kQwYbN43Xb6rCloCKxXI3
	AE59NsvoioC5xn6W+z0i5FVwoGDyskhfrO0AE40tQfaBZu3HTbMXDuA+81nSexWENI12mQKUN1Q
	/1cdZ8/E0W/X/LGQXgtd3O4mTAy4jPx3lglP9S/kLPxOUD3ugfL7S0/CHd93iJbfiiM/XKJ3l
X-Gm-Gg: AYBFou2bFJBOgwa1pkJyuL02kz7e+NViyPwULYdCFJo+mVivJqFSoEAu8eJtHP8maGm
	X0jBenFRkjJAtb3MtCeLbMKt1yV4aefDv0ioh2kzFA1HfMdwnCr8O3yfFMrlbr3coFcneHjJVir
	8RHpvUOG1/lo4EzhC3p9A5VWkRmtanW82tblCop7H+ljMtpvrHCzUNGOOJNMD2KADLsPiR4NgTI
	eK9cGTxLWe7e2wKh7FsPa+erwXTkNeChm5TgKNN/0BHuaWHN92J1E5kdmypqdLPEVuNeySRgtM3
	obXkqhBlKxcSwmjoWYqE6zrg7zBL9CzEEmXj47kIIiub46ENMdGEU62EjsxSEj6ZagipYkeZfzG
	+ttEfH4OB5tnl/lrbEUJ3+S/ziVfnKQ/iKeTG6qqnp3bgx/MoOvlLiey/vZMiujZ0fgr5//olws
	33LI/0o1dVB5IhCXH+BzeADEZmQWM=
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735799eec.36.1794260464469;
        Mon, 09 Nov 2026 13:41:04 -0800 (PST)
X-Received: by 2002:a05:693c:4007:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3751fb368eemr735761eec.36.1794260463774;
        Mon, 09 Nov 2026 13:41:03 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
Message-Id: <179426046162.3811579.4898140189159012556.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:41:01 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX5zrYYl0F2gwI
 Cb9CylXorirpqrzh1qvDg3z+gutJiP0jji2LGz2QvFvguRGUI5ctNwzvxfRBP7UuBi84i7IUjQt
 FKb9OrZTMvJi11geNReJL0Xj7eqZfHnHKHMZvV2u/16V3ptuOaMX9eOs13PJJPnjNXhUuuKhpZu
 f+nKyxvSs2eoK9hO3x5X3ztvuvhrBrLIFQY8miY7iehEu8oZvA5bt72/CspRgXJzde1tt4OZTIJ
 AE8OIOLIK7IYEzYz5vvqcePUDwnIBZcmDShNWjb3V9n+piyirj+GOmLopRU9hLl+QRPvEUBWOxv
 qfbThzAnAiqnmzdCSrpFASjTdcGq5P2728WqqEa+YJm2smtGGL0SDVm+fcq7Fq9Sr+RXWT/Cw3/
 lgho5fNNaoVh5Smi3YT0xolyac74jcNcB0WhFOnlKtuW7N8L94Ieb7jhpTSqgmf6p1HZZ8sRH2t
 6V2vB9k2U6G9vbmCJCQ==
X-Proofpoint-GUID: jFN3L8H_c6zWT8i3PVQvVYmRb5iScYvL
X-Proofpoint-ORIG-GUID: jFN3L8H_c6zWT8i3PVQvVYmRb5iScYvL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX6pI4b1NwaNPt
 syBKGheY4aMgcYMPoDILS9UkZKU2UF257mq1KLGlDvLv9e01N7BnjtsEtC6EboCxCfZ8Sbabw5C
 hPKvlJHm6yf3KreItEWHwsfQTvJi2KI=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af23df1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1y-X7YYiyRxnpW_vcDcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_134105_858429_CAD1A7AB 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 10:33:44 +0800, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix potential SRNG configuration leak on init failure
      commit: 30cd6ad81f234ee01dc67b1d1166db94078edad5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


