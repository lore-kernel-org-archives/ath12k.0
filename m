Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C78606A895
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YpiJ20ZR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0qR3vUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=YpiJ20ZRQTo0oK
	rb3HiHSiLyvtNgxm4uaf79mUcpno8EFJQ53Apbzc5g+WqGGIapgCJA4QKlsmriATUYwso59Piz8bI
	+6k7TrfxsG5pAjQLJg1YmjcQEMNfqGW1hHaowzuP0VTRffpIWuoUZdY/EyeCX55Ip2LM+KMwSULBl
	4z/suDn2Z1i06v+ws+0dqjQREQ5l013vIaIcKpXPOdhaI9SjPBcm9yaXdSkFwq0N23/rEzE9P0Kac
	1XahCoWCdgyEuGxNAV9T7nexWs5Okv8ONtS7X2lT20jHu0ExeVuJiGqhnCtDpCPuo7+KXGoz65i/1
	dsuUQ3NsIt1/biU8ZSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyB9-00000002xgx-0I9D;
	Mon, 16 Nov 2026 14:59:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyB6-00000002xfK-3qwk
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 14:59:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrawY1935112
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=bOLB7abM4jkAfiKf
	yGiF+Cx5NxsP0yPKDepANS4vsPwZqW0hSOkhqfTAlydmEeeOTeOEIHWXYj/B3NZ1
	7xT4h4Jhv2TX+aW2ZLtXc+G8Q4prBJ2v29xIv+pEXWiVOKkAa11Gy0Q2d6POvW68
	pcvWKiYCyT2wry47Pc9qetrNxT6RHvB3NIb/wvX9vSy4Qg6aIRsnlTrAcXhmqhhX
	+RZm1LEkiVlgBDRABJcHRnJQrXac/8XGrOzMfuiMl/MIdkNqS3jN25IZKcF5pJcO
	pwEtMimM2GvoZTNaInvy58ZD31B7lTDWtBa8Gp3SUMMxgXfGNdV64J8rn48YGFli
	spjZzg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2njb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 14:59:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so2461574137.3
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841166; x=1795445966; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=C0qR3vUscf8NCIak+jdWfkeWNbQNRWsVcntt4ZXV2jetcOsa3m6PHYyYzZzfRrqu93
         QFC9FTBarEqSuATyzUtICBmz8TriiyVFyqTeOXQT1U7Cp7gTFBXKmNes5aZqbvb8Nc1h
         xNLr7Fu56lzVVKTcrlSqYBhWbGIww+cWX6BsrE/Z3Wn2IYmAdNsHyoIE2MI9zlkXXmQI
         5BjXlWzl1bLYD0noQtz3J6sJjKQYCAwUbvAPhXnQZEFeUn2a/qr2KDECFAq7Cju3GWKA
         ccEymQzH49e297FtoRml3SJN+BZGs2JAag8yCCIl1BcjYJeq5LAYn+0D2vxUGPwlzNAJ
         3Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841166; x=1795445966;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=CQ17BEHrBYyvRequU6AMANfQjDVqtSD4aH1FonAloabktF9tvYu5zNQHOViYC1WKAM
         VVAHnl16Dd3kq5hI+x5A6gPWNVPwJ4V6fGYtMGmYdz4vGghUrMSdhZDFHURzifYJwP2j
         U5KrrnhBLYNf+DJgfE5LKRjOgIU0QWoyp9QtuflC1+ifDHY+NwpHed7RRLOE1/YLnmo/
         h6+SSyLd5jJtKNP2iVEYCeJ6IO6DLIT1tWx+4LacnJ433Q+KrXXiobaxG0a1ISDwcWSB
         JpMNxAM1J26dhANyGfeLvwo+aQg0gsCLjOfhKdgo80oSuWOsPW+c4SBpAIMkzj5b6dhT
         yKNQ==
X-Forwarded-Encrypted: i=1; AL+hErFQlUs4ASUkqexOloiSVRezm4V0nFm2AusBC6txubpnscF90/HpBINcD4kdT5D8vefJ2WldOx8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/TVqZCXgYFCZpuHC211Byj0MM6AjUWZmJ4IIQH3ptM1FTY4DLt
	qg9eeCjitg5w9vjcWHiKjDxRWKczwXlnr4KwqjUXsMQ5B6Cor9F3XW+u+fOLJfRCbZEwPIJVblY
	ou86B5vJAQ44eHK+uWH6UL+OqgbR4h9Xs0BaieL1bMWaCLk0mwhCZ/EPnIo1ClUJQ
X-Gm-Gg: AYBFou1MOe17JsRWIG1LDFc8egKuhuOf5SLT18E0mgaKdLp1zOB3q0pQJFdSSsr+uBo
	ZjhSGlqI/RP6PNYntjTW8WQa/Ud2a6fXyTSPdMG29nApd9ayDbKnFpJtB9+RI7snxSlEPA4sss0
	mhz7TSomGqXRavRTv4pTyfvAE5fMUGZPag/7HcRO4FY8FPS6HJFKiXgY0XbBKe5llPRqrXDO06f
	c1O8rN+ZzzjC+kG8Lk2GqaeH0+u9Zx9bL0kxQeMqle0t2N8AFzQUWfhfq76m3XuiAHKfSIFlU2H
	o1J5OUHZ5NnU4vfgOByMHhfGQLfirlQ280Hx2ejNyM1jfFXOhZ2WCJPXsESrcdDyIFO074WjJ8H
	JWqO+INwAW33Rli5gkVkz1sjIrpXK116I5CuI8c6OJCvxDcjTeQ/zvfT1iIBS1KdPq59dkG840/
	PAxtql89EPnH7WKA==
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604784137.30.1794841166408;
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604763137.30.1794841165909;
        Mon, 16 Nov 2026 06:59:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to
 assign a unique node id
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115880.1191469.6312889000780599157.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=2289;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=tfSyqr/JVICb+gJ8r7i4p9ZH7pgvqyq8dvPpEHT6sQM=;
 b=kD/xci+qoKdonWMirYRCjPRULCCHqoSo3t+/4LvbeHgPxyp3K1S2tDB5PInEh8mC6gkvdMqN/
 gYgFqDd2UsiDqfjgXDQNm4LLbrHrVFLoTUJYNFudBj58U9gOKZBgCZa
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXyliXR4G765Us
 2sWG0fGfGVrMKb/5mS3JqAEeu+xYbUP/ylGYjpdVf432SFcwvTKNSmx/ztsgyq5I6ebjCOCBg9z
 Rf9KgzfXVq1SR+1tK/3ChKgUdOz/Mgg=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb1a4f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dTT1UR66QJk1rbgP68A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: le9sTfbLCDV8WSP8cwufe2gBx9TNQSkJ
X-Proofpoint-GUID: le9sTfbLCDV8WSP8cwufe2gBx9TNQSkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX14cJn02+aOec
 aWCoTOzSnXBvmzYR2X7qwLdgDU9OgHh52Ok99ljLUXz0sZNJn7pywXTybQwTtt0CiqYvsOasDAg
 j55zMupj72w9G6GG4MOJLSZf4X4af1fI6Glm2Nce58viBBlJTB6eGNmZkq19xQ8qFvvs4YuS0Fk
 ADYmsicXPqQwLH8yW3ut9dDW6mdQII9PZX0qoqqapvqlNCsUuXjNKlXld5p6d+HHZT+EM6ZFpWC
 gX0hnd0yRAxsYJtF5XcBWu40oi61DwPSjC9Gqa8w1QCQVIMCkO6yw8fv0n4p2Tbz3p8j5YkY71W
 bGrwcXKNhgTZ7Qmqzg9riLviyTT/Qa9rfBx5feWk7i62lbMKj/4Dqe3cUiYQUgDvq4vq16v/rcL
 RABbrp9CyKKVF9i7APjWeooWtbaXYS0TsMrF+hlNsd90KO4LC/ygBOFVPFJ4ILPzdo1J/NAgjzP
 QyV6HVcyxJPrJxMD43Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065928_977517_B5D497DB 
X-CRM114-Status: GOOD (  21.30  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

