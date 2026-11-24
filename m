Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996D606A330
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wW3MZsNU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXrqbQup;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TqyUzZKW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=; b=wW3MZsNUkC8HV9
	rI1ps5JziSHXik/xh45cObFARledNk8jyC2CAPrrs4QsO6lBvQJo9OMpU1W/GmVOl+y6gHPWmjCye
	bEUQYd4a0FnUGTPrgySpxDAWl+8wR00fVJpKL/61s3fdRzNCZSVkRu0bmGvtsxGUo0f2MKY7w/JBS
	5T2P1LYyIgZytxqDdLn+4+a5KTpkCz8gihwTfIR7L6e2POBR5U+tVjWOJdvoUfKflOD6YjmUPneOP
	kRX79Ad7omQoo+jrqEfTcoWxmFx6cDPJRwxRqnFjjNC7OD5ypW3Wfl4YVkPlMQDGnghm3ySACHdBi
	nN89UNJ+V/l27zbCo+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTc-00000005gxC-25L8;
	Tue, 24 Nov 2026 06:58:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkTZ-00000005gvj-1vxJ
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 06:58:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kJpc3850807
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=; b=NXrqbQupJfG6Mtnn
	SXb1TxP530Y0fs/L5JXMagoGaOEtVEfjk2EkKBeKB0auOij4TKPbVl01JxCqYGQD
	feBKyb+EDYSXelg5HMrhuW6Hip9/R1Xcwc6QQmct9s9zjJ/1fFn1/gSGDbh084kK
	6p2oSjDBudbtNUYAbMV4K7CewBkfWLzX8l8glsJuBLbVDUkpj77eRoOfG0YLqCqT
	uWVNLYEX0P3dtzBccgP3hYTXRVI6tAFtnDY98HVvIW6Uvzh9ajcMHZ2oUX2K9LaI
	LuEpbIEr+ugqcnlkexeNh2gZpTUQPdxkcUcpoLewOurt9Q3c3BKodSZz0AFWvtDg
	joyXgQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb1aqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:57:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so3046004a91.3
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 22:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795503479; x=1796108279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=;
        b=TqyUzZKWG4chq0W2/Q4H916quGQ3dR7z6qnuYBFdv1lDhT0YF3OIu/2uCck1J5gIQi
         kJzPvoVgQ92FsVLjNx2f25ZE76OcxriY4mzhkv28akvgnNw+SIYWItuaIi23j6Jq0BZA
         q4n5ucyChYCaVZ2SSVdyAnwFEGiBo1PiZOay0of/tHQNa5PEAJX4s9svlUsjX7FuwKD+
         gUReuh+1DzZ0gtphcR3TI5K7EoAB/ZTUbC0w05veufJHpunROdV8Nd5B3d31o3Xkck7E
         tvMbHgAhVRCD6wPv3FhRzYA9OAxTV2FepIE4/tdo0dj1CR+TIWq25HKo4al1Y2ekIlwD
         iHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503479; x=1796108279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKbqU65b2wKaxPlLOhL+UU+Izrqectpa8L9vQ47xaag=;
        b=Qe6mjgBhRlgSvORcbqiTtnZUXvzioFk8pdgAa4piOKG6Qx0COGIhr2FihVK8VRyiia
         tZ3Vm9I4nUj6KPNpuZ/BJi8KHw31Lg7vFmg3D5sPBxvZF6jTORQZi5eXTx4AJN2Z7lM7
         x9MsOvqGE//CUH+ERz8YPv0xRznMtvfT/5M35m4/hNUxtwt6t8ZT9b7KTbPdO4+vAqaz
         KQjBJm0TT7M1zd71tSnBfZDtcdzrmDzHbME3nZpRysnBZDqJgYdkWANm8F7LkQ6zAgVG
         yhKAhn/oTNa0nRfyf083X9cqVhSzZDiqS5CqxU+1I8k9xtb2waLKJeFefUuc2I+ih/xp
         CTuA==
X-Forwarded-Encrypted: i=1; AL+hErFevlHmgJFfaRyGIugooddArgb5sVFiqsLDzhUwIVrM7ET725UC+7LHfLVy300QtJyAvS6IeiE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZBt8olu8ARYfP+jB4jk2ptr60NLBLTueVBCA4k6NdQ/WqxF4D
	S8kzr2gq+tEj7QTVg0Qg7crkxjzutD8nLe+lF2eYUB6uv8wnr6XHV9ISwUl8K0nYxUk3GgwTe11
	MXK9TaSDjboyY8+S2E4pC9Ml5PZuUTbb1yv1r9v+NUg48fnUW/4To06FsG930CclD
X-Gm-Gg: AZFdTZdbhW23JQq32n84E26j1IOFmOhFnj0QFENFkjzKJORLz3mJt7DSetFhFr7H9Bg
	G9yJJ1CxUqUcimVi6l4NVJm7Urv36xLJQlaPJUXAsJyeFFDPCwFfSkxmE1/3ZS+QU2vtm1ejjEz
	n2gSYDZ+75iSpT38EDOsv5I2Q1n1I+hqvIg36u83zbJTz/j/Qyc4dSIIRK2p+75Ax5gV5FYzQei
	eAHIumRf/LTKt5fVn4HSWu3ZUQCyypszPfLwqH/Hgk6XuBol9taCP5Amwv8+wiEoCAsyYu+lSsi
	8o+525ntKim2M0RJbQ/W2UBUKMkY8hJh03aLsZM34kQ0Fk5HdhExd7ubatMN/Vq6Qa+Za6w1xos
	B1spHrfaX1tELumkcOgSD1aSP4st06t0+mzvm45eZNJQuRnMXR3gJcbt2+xRDDw/IU0J1KKKaSA
	0padVMCRiXUaSceoStfLSE9QRruPBUkEB16rKM4EOZxrUNpW7lUVUpB3xfmLRD5cW3S7H7Tk27
X-Received: by 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr11712160a91.57.1795503478669;
        Mon, 23 Nov 2026 22:57:58 -0800 (PST)
X-Received: by 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr11712142a91.57.1795503478177;
        Mon, 23 Nov 2026 22:57:58 -0800 (PST)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm23819811a91.11.2026.11.23.22.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:57 -0800 (PST)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:27:37 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Handle IRQ retrieval failures
 in AHB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-handle-irq-retrieval-v1-1-e2403fac4e9f@oss.qualcomm.com>
References: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
In-Reply-To: <20261124-handle-irq-retrieval-v1-0-e2403fac4e9f@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        P Praneesh <praneesh.p@oss.qualcomm.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b053577 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5OVhI-57ki2XEZi5AbcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tbpZJc_r3qUdNBuqrmRxl5RfWyX6yM_R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfX7eofa3RbPxmn
 xHU7mc3XbAbU6SoN3GE5ZvmcJuy6tr2b6o0cVjUEbeszNfTTUt4AEJutyrcUCuBx5eGKOzbxtjQ
 WXhdO5AFD+ZIYEDvAXA7diTaGlJ0h5c=
X-Proofpoint-GUID: tbpZJc_r3qUdNBuqrmRxl5RfWyX6yM_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNyBTYWx0ZWRfXxi7CKAEnDIav
 ugiFRa+2nk6JpLnb5Rg1IbIZpP01cVTfAHxUz+KvGRQCeE8Hv4XW3+aTSlpd8yFFcxow/EUYUfd
 wrV1adHpStGMLZHaNMRnOL6AzSMOe3S0vDWqmn5Y0vh0g//TEtlf+c8fy7kBjh3krfbH2JiBqeA
 TY5XiMyatTfC5XmUyH8hiKVVjiowEun5GH/NMNdSJXGORnPl2TrP0TO+4IV7ClrA8BY/c8+w5tc
 nL+gFl+xPcCF5fgsSHaW+37O286/0kDclyWfS1arH3pzaXheVyLzdyGXll5khciOfIP3smVliOJ
 CbjlNsk6NdA21sWziOmqQe6WGEH3ZQMjocroiwr7A7a0GQTqgwsD6rUJoUTJcfLdAitT7U7PYke
 Yy8QIcAASiqKPpu007cG2iNQsbJcc82fhjl22QDh2YT6C/0uEssmin54K4FJYY43586wfJABrrt
 0aQYfy8MZ7Kl9/1voYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225801_621991_1FF377A5 
X-CRM114-Status: GOOD (  14.29  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

platform_get_irq_byname() returns a negative error code on failure.
Without checking the return value, the driver passes an invalid IRQ
number to irq_set_status_flags() and devm_request_irq().

Check the return value of platform_get_irq_byname() in both the CE
and external IRQ configuration paths. In the external IRQ path, exit
early on failure, free the current group's NAPI instance, and
propagate the error to the caller instead of continuing with an
invalid IRQ number.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..64e4a6c5affb 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -701,6 +701,14 @@ static int ath12k_ahb_config_ext_irq(struct ath12k_base *ab)
 
 			irq = platform_get_irq_byname(ab->pdev,
 						      irq_name[irq_idx]);
+			if (irq < 0) {
+				ath12k_warn(ab, "failed to get irq %s: %d\n",
+					    irq_name[irq_idx], irq);
+				ret = irq;
+				ath12k_ahb_free_napi_for_group(irq_grp);
+				goto free_napi_ndev;
+			}
+
 			ab->irq_num[irq_idx] = irq;
 			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
 			ret = devm_request_irq(ab->dev, irq,
@@ -741,6 +749,12 @@ static int ath12k_ahb_config_irq(struct ath12k_base *ab)
 
 		INIT_WORK(&ce_pipe->intr_wq, ath12k_ahb_ce_workqueue);
 		irq = platform_get_irq_byname(ab->pdev, irq_name[irq_idx]);
+		if (irq < 0) {
+			ath12k_warn(ab, "failed to get irq %s: %d\n",
+				    irq_name[irq_idx], irq);
+			return irq;
+		}
+
 		ret = devm_request_irq(ab->dev, irq, ath12k_ahb_ce_interrupt_handler,
 				       IRQF_TRIGGER_RISING, irq_name[irq_idx],
 				       ce_pipe);

-- 
2.34.1


