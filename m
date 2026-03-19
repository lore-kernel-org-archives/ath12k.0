Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A141090233
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyR/DEKSshAx9ZjwsfQozRP2Lry/ms/E5lB9zjtmtnA=; b=RZO2NcAGsVV3Y3QVhksyoCVBj6
	ATfSHOMSJT+TL02/KL0lCn64lIgpKmXE2VtDGcOoijGu0dZ1vccG5HOria5yOho3jaDogvTVpHLUV
	ofYmF1+CrnyD617VYIIz16My+idrNgisyzeX6AH/WvG52/y4K+Bff+QaxFqbXCbx/ixLa2zmMeZzd
	5GDW/dUCdNl0a75ym7ogBT9vwAHW2BPPu+jxA7SqX+k4r3yVN4RAt6IuQS+sbFQMjuKomYkPKUofp
	oOLOXGhZixMHBWGi6/bIcqtglz236zLtZ//6sFQJ8m0gjGOzNO3/C+iOwpMsWfBNXqwUaUwJNNkEi
	P7KqHtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ETj-0000000AoOW-3knj;
	Thu, 19 Mar 2026 14:36:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ETh-0000000AoNx-0bcn
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 14:36:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fb112c09so6141745e9.1
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773930959; x=1774535759; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyR/DEKSshAx9ZjwsfQozRP2Lry/ms/E5lB9zjtmtnA=;
        b=l9dRbz/0WbFYNZ6rviQPlGNCAc0ve3pP8TljLQu6a58K1F/b3aD6WRKclk3KT0yK6I
         xVXT57UgrgvLV8kiY7PxDi6ylGLGRxvq59TV8pQuME66jVjzbaEKpr9yXmI995WQ2ZBt
         LukmnAXkX3soIeS9KFHp7Yc9iv3I0dfFo9bn6GUmhDeDesYEYRVAONab3vzfoM9fgQN+
         QbUlrIp5jDIiqgJ8HuOBjGDYN/3779pWJbLPJgoP69/dLrcGvvhSTTTEjmln3DJcdKFn
         Mqqyr8/XOK1nu87M6px4J1Q3z6oobSyAyAeh52dvjRPKaSYbaEUE4O6GhCVF8ZcAqlZB
         dwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930959; x=1774535759;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyR/DEKSshAx9ZjwsfQozRP2Lry/ms/E5lB9zjtmtnA=;
        b=RK7T9Acvny6DPNYcrI9v3xzAUyndzY5dvsNACRHChuNR5kcwCvTMqTkiOktpLXHa8a
         vxHPclo9BrQvApayf2V3cr/khduAavUelBq0KgcZkwAvu/kPFHzkyJtpkWtkRz5iLZPe
         p4sxCILq1IY9XgEQ3rcIaA8NSuh0Vsfv8HBLCJGlmhjJSgU1BTOrXguJd94bn/0af5jq
         W6JvHb8lD0nQW5TL4tqzTPDFypXhLGOzPh+tOfusUVKK66g1+3oX/M1ODNgWn6CbBM6M
         +I72gISw1iZ4QqLifoSma0VXEGs9039dKuhVfYMov/j7S0EqFfy7X9NsGmtr0eDT9WQI
         Zucw==
X-Forwarded-Encrypted: i=1; AJvYcCXWCdXj5iKNqPEKn/XY3yfqifiRdgBhELsuf6jRlH6MfQatR+3lwQsmbcOjdVFFFlEpLv0ejro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/MqGgHMQE4jmghW28eq9BmB4sHYJPr9JE6vxMMoaIKo5IW3fb
	s/9bS26YO1VqNogU2/ueXNUwS+l7+kVY5naMSHVCz82ee03fVf1lrzfN
X-Gm-Gg: ATEYQzzsFO2JC8r7BGqAkBMjCvHlaOSl8xixr99vXhM4VFiGPsxGvAplEcOXSeYdUo4
	jTtqfNQTYEJJfLyRSY7ELs3vL9Te28Dp5dWRzZE22JpZOy9Kl8LhC74b0YvkfC1xpBLWSodx22r
	3N/+UBf7JwI/Gb5DLUH5aKIRzDp2TW6lvW4gD+RHv/GXzbkyrF/CskyIMLFdkoW7c1KfjyGGMEi
	dWgVU7VHz59Vrc7xyofwUUBhKh69OXGahqY9qdxnnyJR4V6yraRXUcmG2XIg2e3N1yUfwnGih2N
	KBi6M/7Y/pbssI9qpidOcjhiFs0hPcNA7BUoSo54OsxU/SrQKlqOYgKWsYhuDfDlHqP72VIR9fr
	ESDwM39+sJcUv1EGezKFqc2i5J75tuDepc1OZ5hFi81IXey7cS7JBd+u97FmbLdTce1eBvamrfr
	9s/zGhLWGpChYON3Nij+W/OQZ02/vFmQ2GExJx+iUl9v76nqXok/oz
X-Received: by 2002:a05:600c:3e85:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-486f4d2eb2cmr104779845e9.13.1773930958452;
        Thu, 19 Mar 2026 07:35:58 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b949a5sm65736155e9.11.2026.03.19.07.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:35:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 15:35:57 +0100
Message-Id: <DH6U1JMUQXVM.287BFERLLK9KK@gmail.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Rameshkumar Sundaram" <rameshkumar.sundaram@oss.qualcomm.com>, "Nicolas
 Escande" <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317084740.3756880-1-nico.escande@gmail.com>
 <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
In-Reply-To: <36c1cae8-d6c0-4432-bc8e-57216c5ea3fd@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_073601_214278_4BAF2F39 
X-CRM114-Status: GOOD (  18.45  )
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

On Thu Mar 19, 2026 at 12:08 PM CET, Rameshkumar Sundaram wrote:
>
> Since CONFIG_ATH12K is tristate, a built-in boot can continue past a=20
> failed ath12k_init() and still run ath12k_wifi7_init().
>
I genuinely thought the kernel prevented this. I was wrong.

> Please ensure that later initialization path is guarded against=20
> allocation failure.
>
I can add a flag like so to be able to check from ath12k_wifi7_init() if th=
e
init finished ok. Something in the lines of

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/=
ath/ath12k/core.c
index 6c034071cc6d..742fb33f41ff 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -34,6 +34,9 @@ module_param_named(ftm_mode, ath12k_ftm_mode, bool, 0444)=
;
 MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 EXPORT_SYMBOL(ath12k_ftm_mode);
=20
+bool ath12k_init_ok =3D false;
+EXPORT_SYMBOL(ath12k_init_ok);
+
 /* protected with ath12k_hw_group_mutex */
 static struct list_head ath12k_hw_group_list =3D LIST_HEAD_INIT(ath12k_hw_=
group_list);
=20
@@ -2323,7 +2326,14 @@ struct ath12k_base *ath12k_core_alloc(struct device =
*dev, size_t priv_size,
=20
 static int ath12k_init(void)
 {
-	return ath12k_wmi_alloc();
+	int ret;
+
+	ret =3D ath12k_wmi_alloc();
+	if (ret)
+		return -ENOMEM;
+
+	ath12k_init_ok =3D true;
+	return 0;
 }
=20
 static void ath12k_exit(void)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/=
ath/ath12k/core.h
index 59c193b24764..f35571b1a541 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -101,6 +101,8 @@ enum ath12k_crypt_mode {
 	ATH12K_CRYPT_MODE_SW,
 };
=20
+extern bool ath12k_init_ok;
+
 static inline enum wme_ac ath12k_tid_to_ac(u32 tid)
 {
 	return (((tid =3D=3D 0) || (tid =3D=3D 3)) ? WME_AC_BE :
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/core.c b/drivers/net/wir=
eless/ath/ath12k/wifi7/core.c
index a02c57acf137..542ec10fabf1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/core.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/core.c
@@ -38,6 +38,9 @@ void ath12k_wifi7_arch_deinit(struct ath12k_base *ab)
=20
 static int ath12k_wifi7_init(void)
 {
+	if (!ath12k_init_ok)
+		return -ENOTSUPP;
+
 	ahb_err =3D ath12k_wifi7_ahb_init();
 	if (ahb_err)
 		pr_warn("Failed to initialize ath12k Wi-Fi 7 AHB device: %d\n",


I don't like it much but it is easy enough.
But I don't know if there is a more idiomatic way of doing things

> Or may be have this allocated on first device probe and free it on last=
=20
> device deinit ?

That seems even more involved. It would be easier to go back to the previou=
s
version and simply, alloc it once per ath12k_base

What do you guys think ?

