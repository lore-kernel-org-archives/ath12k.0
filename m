Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82387606A335
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v2y8F22Y;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=db3BevUI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fWFLjhLz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=; b=v2y8F22YVUmkbg
	7yk6dFmnZusOJc7wH6X/LCv0vDWKgwg1gcyTRS00ER6DQ1bqgzFl+Wy+0NJ7VT0XJ6O6AzoXZ9eVD
	QWLzQHD78rotL6UIDAgLEa3Yl8IIL60t5hw1272s4aTXdWzDxBpVEYnpk/xR4jwl4igNfcoSdEIk/
	L5iNo/J6RWvazl50dYyYOecd7nFOCvsY9FWlm9/e3WNm2Dl6dl24rXuFDMsKhuo0HSMSbdzLUF525
	XFMbMEyZ5m/wFqsUec/RYZhsxMVnHspgYbssmN3dEVJv+CmuntBljzKNLDrWp57mL31OICShGNwC/
	u4W9NYOtn9nhqa9GvjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsmQ-0000000DHs7-288p;
	Fri, 13 Nov 2026 15:01:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsmL-0000000DHqU-27HX
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 15:01:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJQYG1525275
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 15:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=; b=db3BevUIOLLkQ9OQ
	Gc4Z/l9fFkZGb0IEd8Opjde10tEha+oJaTFK74va4XH11WXGTCDj0bTq5y2BwhlH
	FtY0dW2nPSrxk4uU5KPi6usK+PUZu2vMfNwNtko5Oq3ysH/wptdJgrBMifGo+yiI
	t6zSth983eGis8ykBjrJ0FnV14UyV43ckDheMFvwogT+tfipKLllk3ZpbJTBsMY7
	FgfFyibwZNN4KO/ks7UJ6qosLVxWkE0AI/b2OqgZwWRJPzXlsQf/Gbl4aqHEhZQS
	JB+4cauaw/6t7TUrfLczwDWxgNomnfQLqm/hoSl+l9ReUAbdjtaROSvYvmO+qtwA
	JnxZPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g210hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 15:01:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso1501861b3a.2
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582083; x=1795186883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=;
        b=fWFLjhLzCrpWiO8BcniclvD0zEjgS8xbseRZfYPiv1vlkSyDZvDaQxT7QsGzl1cccU
         D/L5v443cpfAowWAQiATVqVyFzjW1qwXg3S+ENAAVXE/bMyKJVUHHV3kXMKYWf26Fgb6
         GYmPRMzjTAH4j8rKqyhaCOBOEbvR/PqrJSXGoHwW+Req9LVdGaKKIV5RD0t4R2zY79CV
         G/3y1M9n9NfmjZELQmJOs3N0iA5dVCw58EBg6L3qLNvtQQGUhI293kra82LeNdPdbTrM
         9magopRLmInmJMRP5moke7s0cXjJY6GI1362vFdl9iVsLGiDBrUXaJsciJeVk+5a8rLu
         v54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582083; x=1795186883;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Exs8Q30IzUVvqimeo/nqIxzGT3S6odHDS1qCj6yj8xs=;
        b=aEe4pChFmM1BD36Rk0yrbLmm/ojDCqmMpV6cpFZ0ANtVOyd0QIJo+hz4uFsGXfry8i
         F+4ckxxh95ib5VY9dTtHraufmw7SnopuYsfsom1iIRST/1+g+Kq6oc7hsdmDvim1Mxd1
         wYnJa4fMjHU+vUJOFZ5AmWUnzX6xlkXZZqxRKSHztO75CdJDWrwFx3nr9XBllvTqikHa
         LNyV3tamXt7wA6MJpmz/MpStcR3wmMPLmbR4ByLTsLNbS8L1GGsJ+zhjlluxwPana+LO
         Rf8W4wGlxgd3bh2nzd6L2F6N0vsPhl0McHVrKhvS0OCoH3fgba+W2p3uBnUS6NWdcKOb
         NDjg==
X-Forwarded-Encrypted: i=1; AL+hErH3TbGxFAf/PbL3VwuKhCfOgsaiQMTIkFK7f+5/q/MZLU6CwaRCfuVIe6SKXvxusnBefmb9NBk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/C03SH1721SULNZoocUptclziieij/CowH2ohBeQAQJbOBO+XY
	Co95B8LtE0ZDk4ON9eJrRXoYQZc6d+CnWSB1z7EKhOkcDAWCelVy08twrkG67epPhKsZVQeSuI1
	/G+jGJWHOf6DfK6kW7hWeSiY4ErK7isswqMyWVlIUNvvJuK/X3B6zFmZSGOR8OWgi
X-Gm-Gg: AYBFou0zMzPWYIELA96UMw44kXgLURlcJD9rfWRQLahdvegS0ELIlrKwRWUuT4/Su/Z
	6ZAQtue2UTzbeMiVgU1PYD7frz5+3PtXEEXnffL/GAtGqqk6kai0jy3w+q9WlcSwLe5hk6ynilZ
	wqSocdx+LiViwUpzKEC2qgA5yl0M+hmUlzCfgj6W3xi2bJOvIJ61ndMjdRiFo/YaD9n1kn/9cuj
	JqlcI7esQjbXzzx/FW5NB+48RdMWG7NXHL3dNftr7lHkRd3O8jdz05FhLEc+4zZXqX+EJ23qAhk
	xC2bLKX7X/BHzdHsSuDkdLK/14fX+1J9gccJaK9Sbdhz/2QAp9j7hWtKe3+65W4j0w+8yg18Qee
	oGS4REE2BT0J2JiU06fe5kuEysk9mkScITN2WAEBmmnnTNT7atSFb/4IPxY711vhVucFmKW4G0W
	1AJYAwEieZnnEtyUIvaqORqIi5HMU=
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2903311b3a.7.1794582082908;
        Fri, 13 Nov 2026 07:01:22 -0800 (PST)
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2903266b3a.7.1794582082281;
        Fri, 13 Nov 2026 07:01:22 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1e5ac38sm1229474b3a.31.2026.11.13.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:01:21 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
References: <20261111-ath12k-coccicheck-mac-v1-1-6d8ac143ef05@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: use str_enable_disable() in
 mac.c
Message-Id: <179458208113.912426.6104563927231383217.b4-ty@b4>
Date: Fri, 13 Nov 2026 07:01:21 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX19qj6KvkpA+Y
 hWpH4lCUVVl1QZ1nu2Tv/m4qRbmN08GfbYJuJT/766vn4h2hXHMxPvbC2hruguT4qjpY66nUIty
 QuNfmgyj8bSJn/3kdO4lDIBkIUYJM9miuXu1CWYp6pKxEkqaCF3815AQuuHdvejs00qTvx1NArm
 IvZ7zbzkOkAYB6gZePMjgvO07Qv8f18a8M218WsX3IiS9cuur03BYa5edyLRxzLj6lSSvWPCOOo
 xHuWRKT4VhVs6He1ZI/vtE5eeC0MlbucRQahodVDpzfCEdyFJgPmiv87Ov6SjjevX8tdWzhKtOH
 DgOoGNwtXBD4c4cbdrN8eZ3yCNwpr/lf2Ul7e3rgl7M4GnAB7l0CHGIu3twZXM5k7m18c0BZYf3
 ldwGMvew0YBS9cP05mQmKOlfISAVXv0Z0yQs3ww1BHVmvQ2kbdAmu8hQD1DuENR+r5B1l15ydhk
 NjXs5j1xHjcVdi6ebHQ==
X-Proofpoint-ORIG-GUID: Lg60xewbAbe3F9r5_gftFiEidtrfSHB5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX8LFo1BFANjP4
 iKSJib7gOizTTE62S8WRWku+p/1pIy1yUJLtER5Aca8aJFENhJVZqxc99DjyvZYnyULx4ItDWXK
 Wkgv1506Us7802+V8KnLVa2QPpEArTM=
X-Proofpoint-GUID: Lg60xewbAbe3F9r5_gftFiEidtrfSHB5
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af72643 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lzJ5LNNlOlyJiXIcJQYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_070125_571934_45A58D00 
X-CRM114-Status: UNSURE (   7.95  )
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


On Wed, 11 Nov 2026 08:22:06 -0800, Jeff Johnson wrote:
> "make coccicheck M=drivers/net/wireless/ath/ath12k" reports:
> 
> ./mac.c:4556:21-27: opportunity for str_enable_disable(psmode)
> 
> Update ath12k_mac_vif_setup_ps() to use the str_enable_disable() helper.
> 
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use str_enable_disable() in mac.c
      commit: 1be6c8d3027d4a421dc46b93a89a196c61945614

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


